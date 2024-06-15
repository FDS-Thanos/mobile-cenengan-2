class Transaction {
  final String date;
  final String bankName;
  final String recipientName;
  final String amount;
  final String transferType;
  final String status;

  Transaction({
    required this.date,
    required this.bankName,
    required this.recipientName,
    required this.amount,
    required this.transferType,
    required this.status,
  });
}
