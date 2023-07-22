class WalletHistoryModel {
  String entryType, date, amount, method;
  bool doShareImage;

  WalletHistoryModel(
      {required this.entryType,
      required this.date,
      required this.amount,
      required this.doShareImage,
      required this.method});
}
