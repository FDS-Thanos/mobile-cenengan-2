class Bank {
  final String name;
  final String bankID;

  Bank({required this.name, required this.bankID});

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      name: json['Name'],
      bankID: json['BankID'],
    );
  }
}
