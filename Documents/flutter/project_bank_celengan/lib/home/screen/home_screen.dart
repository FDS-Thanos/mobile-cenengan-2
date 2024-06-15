import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_api/antarbank/antarbank_view.dart';
import 'package:flutter_login_api/auth/cubit/auth_cubit.dart';
import 'package:flutter_login_api/componen/text.dart';
import 'package:flutter_login_api/history/history_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const HistoryPage(),
    const LogoutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 72, 114, 0.5),
      appBar: _pageIndex == 0
          ? AppBar(
              toolbarHeight: 80,
              backgroundColor: const Color(0xFFFAFAFA),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ImageWidget(),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Builder(
                        builder: (context) {
                          final user = context.select(
                            (AuthCubit auth) => auth.state.user,
                          );
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Good Morning,',
                                style: mediumBoldBlue,
                              ),
                              Text(
                                '${user?.firstName} ${user?.lastName}',
                                style: kecilMediumBlue,
                              )
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            )
          : null, // AppBar hanya muncul di halaman utama
      body: _pages[_pageIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: const Color(0xff014872),
        height: 60,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.history, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 350,
              height: 150,
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
                    Text("Saldo Tabungan Anda", style: kecilBoldWhite),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Rp 49.500.000,58', style: besarBoldWhite),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '999-999-999',
                      style: kecilRegulerBlue,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: 350,
              height: 160,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Transfer",
                      style: kecilBoldWhite,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        // Menu 1
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TransferAntarbankView(),
                                ),
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/ic-slip-gaji.png",
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Center(
                                      child: Text(
                                        "Bank Lain",
                                        style: kecilRegulerBlue,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Spasi antara menu 1 dan menu 2
                        const SizedBox(
                          height: 5,
                        ),
                        // Menu 2
                        Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/ic-slip-gaji.png",
                                    width: 30,
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text(
                                      "Sesama Bank",
                                      style: kecilRegulerBlue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
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

class LogoutPage extends StatelessWidget {
  const LogoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          context.read<AuthCubit>().logout();
        },
        child: const Text("Logout"),
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: HistoryView(),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/yuni.png'),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
