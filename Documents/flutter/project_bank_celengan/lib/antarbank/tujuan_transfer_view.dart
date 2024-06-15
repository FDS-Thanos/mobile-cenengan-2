import 'package:flutter/material.dart';
import 'package:flutter_login_api/componen/text.dart';

class TujuanTransferView extends StatelessWidget {
  final String selectedBankID;

  const TujuanTransferView({super.key, required this.selectedBankID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Transfer'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 350,
              height: 70,
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [Color(0xFF014872), Color(0xFFA0EACF)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("Bank Tujuan : $selectedBankID",
                        style: kecilBoldWhite),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
