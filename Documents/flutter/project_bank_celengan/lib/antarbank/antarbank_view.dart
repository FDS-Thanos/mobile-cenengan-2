import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_api/antarbank/tujuan_transfer_view.dart'; // Sesuaikan dengan lokasi file TransferTujuanView.dart

// Model untuk Bank
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

class TransferAntarbankView extends StatefulWidget {
  const TransferAntarbankView({super.key});

  @override
  _TransferAntarbankViewState createState() => _TransferAntarbankViewState();
}

class _TransferAntarbankViewState extends State<TransferAntarbankView> {
  String? _selectedBank;
  List<Bank> _banks = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchBanks();
  }

  Future<void> _fetchBanks() async {
    Dio dio = Dio();
    try {
      final response =
          await dio.get('http://localhost:8081/transaction/list-bank');

      if (response.statusCode == 200) {
        final data = response.data;
        final List<dynamic> banksJson = data['Data'];

        setState(() {
          _banks = banksJson.map((json) => Bank.fromJson(json)).toList();
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load banks');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        title: const Text(
          'Transfer Antar Bank',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pilih Bank Tujuan:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _banks.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_banks[index].name),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TujuanTransferView(
                                  selectedBankID: _banks[index].bankID,
                                ),
                              ),
                            );
                          },
                          selected: _banks[index].bankID == _selectedBank,
                          selectedTileColor: Colors.blue[100],
                        );
                      },
                    ),
                  ),
                  Text(
                    _selectedBank != null
                        ? 'Bank yang dipilih: $_selectedBank'
                        : 'Belum ada bank yang dipilih',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
      ),
    );
  }
}
