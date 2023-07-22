import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../utils/colors/colors.dart';
import '../utils/constants/app_urls.dart';
import 'AssetUtilities.dart';

/// THIS IS THE CLASS FOR SHOW IMAGES...
/// ignore: must_be_immutable
class CustomImageView extends StatelessWidget {
  final String? imageUrl;
  final bool? isFromAssets;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final BorderRadius? radius;

  const CustomImageView(
      {Key? key,
      this.imageUrl,
      this.isFromAssets = true,
      this.height,
      this.width,
      this.fit,
      this.radius})
      : assert(imageUrl != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: radius ?? BorderRadius.circular(0),
        // color: ColorUtilities.primary_050,
      ),
      child: ClipRRect(
        borderRadius: radius ?? BorderRadius.circular(0),
        child: isFromAssets ?? true
            ? Image.asset(
                imageUrl!,
                height: height ?? null,
                width: width ?? null,
                fit: fit ?? BoxFit.contain,
                errorBuilder:
                    (BuildContext? context, Object? obj, StackTrace? st) =>
                        Image.asset(
                  AssetUtilities.applicationlogo,
                  height: height ?? null,
                  width: width ?? null,
                  fit: fit ?? BoxFit.contain,
                ),
              )
            : CachedNetworkImage(
                imageUrl: "${AppUrls.ImagebaseUrl}${imageUrl ?? ""}",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      //image size fill
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                placeholder: (context, url) => Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: cPrimaryColor,
                  ), // you can add pre loader iamge as well to show loading.
                ), //show progress  while loading image
                // errorWidget: (context, url, error) => Image.asset(
                //     "assets/images/home_images/horse_image_large.jpg"),
                //show no iamge availalbe image on error laoding
              ),

        // Image.network(
        //     imageUrl!,
        //     height: height ?? null,
        //     width: width ?? null,
        //     fit: fit ?? BoxFit.contain,
        //     errorBuilder:
        //         (BuildContext? context, Object? obj, StackTrace? st) =>
        //             Image.asset(
        //       AssetUtilities.applicationlogo,
        //       height: height ?? null,
        //       width: width ?? null,
        //       fit: fit ?? BoxFit.contain,
        //     ),
        //   )
      ),
    );
  }
}
