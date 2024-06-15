import 'package:flutter/material.dart';
import 'package:flutter_login_api/componen/text.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  List<String> years = [];
  String selectedYear = '2023';

  @override
  void initState() {
    super.initState();
    // Generate a list of years dynamically
    int currentYear = DateTime.now().year;
    int numberOfYears = 10;
    years = List.generate(
        numberOfYears, (index) => (currentYear - index).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'History',
                style: mediumBoldBlue,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const DetailHistoryView(),
                  //   ),
                  // );
                },
                child: Text(
                  'Detail Transaction',
                  style: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.underline, // Add underline
                    color: blueColor, // Add color for the "button" text
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Pengeluaran',
                style: kecilBoldWhite,
              ),
              const SizedBox(
                height: 20,
              ),
              CircularPercentIndicator(
                radius: 50.0,
                lineWidth: 10.0,
                percent: 0.80, // Set percent to 0.80 for 80% progress
                center: Text(
                  "80%",
                  style: mediumBoldWhite,
                ),
                progressColor: whiteColor,
                circularStrokeCap: CircularStrokeCap.round,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [Color(0xff014872), Color(0xffA0EACF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Text('Oktober', style: kecilBoldWhite),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 393,
                height: 300,
                decoration: const ShapeDecoration(
                  color: Color(0xFFFAFAFA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Transaksi Hari ini",
                        style: semiBoldBlue,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Senin, 13 Oktober 2023',
                        style: kecilBoldBlue,
                      ),
                      Text(
                        '10.00 WIB',
                        style: kecilRegulerBlue,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Penerima : YUNI NUR ROHMATILAH',
                        style: kecilBoldBlue,
                      ),
                      Text(
                        'Jenis Transfer : AntarBank BCA',
                        style: kecilRegulerBlue,
                      ),
                      Text(
                        'Keterangan : Bayar Kosan',
                        style: kecilRegulerBlue,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          'IDR 1.500.000',
                          style: semiBoldBlue,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [Color(0xff014872), Color(0xffA0EACF)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Center(
                            child: Text('Berhasil', style: kecilBoldWhite),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
