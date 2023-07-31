import 'package:flutter/material.dart';
import 'package:googleapis/youtube/v3.dart' as youtube;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: YouTubeLiveStreamingDemo(),
    );
  }
}

class YouTubeLiveStreamingDemo extends StatefulWidget {
  @override
  _YouTubeLiveStreamingDemoState createState() =>
      _YouTubeLiveStreamingDemoState();
}

class _YouTubeLiveStreamingDemoState extends State<YouTubeLiveStreamingDemo> {
  late youtube.YouTubeApi _ytApi;
  bool _isApiInitialized = false;
  bool _isAuthorized = false;

  @override
  void initState() {
    super.initState();
    _initializeApi();
  }

  Future<void> _initializeApi() async {
    const clientId = 'YOUR_OAUTH2_CLIENT_ID';
    const clientSecret = 'YOUR_OAUTH2_CLIENT_SECRET';
    final scopes = [youtube.YouTubeApi.youtubeForceSslScope];

    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');

    final client = await auth.clientViaUserConsent(
      auth.ClientId(clientId, clientSecret),
      scopes,
      prompt,
    );

    await prefs.setString('access_token', client.credentials.accessToken.data);

    _ytApi = youtube.YouTubeApi(client);
    setState(() {
      _isApiInitialized = true;
      _isAuthorized = true;
    });
  }

  Future<youtube.LiveBroadcast?> _createLiveBroadcast() async {
    try {
      final broadcastSnippet = youtube.LiveBroadcastSnippet()
        ..title = 'Test Live Stream'
        ..scheduledStartTime = DateTime.now()
        ..scheduledEndTime = DateTime.now().add(Duration(hours: 1));
      final broadcastStatus = youtube.LiveBroadcastStatus()
        ..privacyStatus = 'public';
      final liveBroadcast = youtube.LiveBroadcast()
        ..kind = 'youtube#liveBroadcast'
        ..snippet = broadcastSnippet
        ..status = broadcastStatus;

      final liveBroadcastInsertRequest = await _ytApi.liveBroadcasts
          .insert(liveBroadcast, ['snippet', 'status']);
      return liveBroadcastInsertRequest;
    } catch (e) {
      print('Error creating live broadcast: $e');
      return null;
    }
  }

  Future<youtube.LiveStream?> _createLiveStream(String broadcastId) async {
    try {
      final streamSnippet = youtube.LiveStreamSnippet()
        ..title = 'Test Live Stream'
        ..description = 'Test Live Stream Description';
      final liveStream = youtube.LiveStream()
        ..kind = 'youtube#liveStream'
        ..snippet = streamSnippet;

      final liveStreamInsertRequest =
          await _ytApi.liveStreams.insert(liveStream, ['snippet']);
      if (liveStreamInsertRequest != null) {
        final bindRequest = await _ytApi.liveBroadcasts
            .bind(broadcastId, ['id'], streamId: liveStreamInsertRequest.id!);
        if (bindRequest != null) {
          return liveStreamInsertRequest;
        }
      }
      return null;
    } catch (e) {
      print('Error creating live stream: $e');
      return null;
    }
  }

  void prompt(String url) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WebviewScaffold(
          appBar: AppBar(
            title: Text('YouTube API Authorization'),
          ),
          url: url,
          withZoom: true,
          withLocalStorage: true,
          hidden: true,
          initialChild: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Live Streaming API Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _isApiInitialized && _isAuthorized
              ? () async {
                  final liveBroadcast = await _createLiveBroadcast();
                  if (liveBroadcast != null) {
                    final liveStream =
                        await _createLiveStream(liveBroadcast.id!);
                    if (liveStream != null) {
                      print('Live Broadcast ID: ${liveBroadcast.id}');
                      print('Live Stream ID: ${liveStream.id}');
                    }
                  }
                }
              : null,
          child: Text('Create Live Stream'),
        ),
      ),
    );
  }
}
