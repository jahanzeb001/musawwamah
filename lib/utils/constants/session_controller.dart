class SessionController {
  SessionController._privateConstructor();
  static final _instance = SessionController._privateConstructor();

  factory SessionController() {
    return _instance;
  }

  String verificationId = "";
  int? horseId;
  int? deliverAccountId;
}
