import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_api/auth/cubit/auth_cubit.dart';
import 'package:flutter_login_api/componen/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(1, 72, 114, 0.5),
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: const Color(0xFFFAFAFA),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          title: Row(
            children: [
              const ImageWidget(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Builder(
                    builder: (context) {
                      final user = context.select(
                        (AuthCubit auth) => auth.state.user,
                      );
                      return Column(
                        children: [
                          Text(
                            'User ID : ${user?.id}',
                            style: kecilBoldBlue,
                          ),
                          Text(
                            'Hai, ${user?.firstName} ${user?.lastName}',
                            style: kecilRegulerBlue,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
              const Spacer(),
              const LogoutButton()
            ],
          ),
        ),
        body: Padding(
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
                        Text("Saldo Tabungan", style: kecilBoldWhite),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('Rp 49.500.000,58', style: besarBoldWhite),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '999999999',
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
                          "Fitur Utama",
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
                                  // Navigator.of(context).push(
                                  //   MaterialPageRoute(
                                  //     builder: (context) =>
                                  //         const SlipGajiPage(),
                                  //   ),
                                  // );
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
                                          "assets/images/ic-slip-gaji.png/ Ganti dengan path gambar Anda",
                                          width: 10,
                                          height: 10,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Center(
                                          child: Text(
                                            "Transfer Rupiah",
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
                                      // Image.asset(
                                      //   "assets/images/ic-slip-gaji.png/ Ganti dengan path gambar Anda",
                                      //   width: 30,
                                      //   height:
                                      //       30, // Sesuaikan warna ikon sesuai kebutuhan
                                      // ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                        child: Text(
                                          "Bayar",
                                          style: kecilRegulerBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
                                      // Image.asset(
                                      //   'ic-katasandi'
                                      //       .toPNG, // Ganti dengan path gambar Anda
                                      //   width: 30,
                                      //   height:
                                      //       30, // Sesuaikan warna ikon sesuai kebutuhan
                                      // ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                        child: Text(
                                          "Top Up",
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
        ));
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<AuthCubit>().logout();
      },
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.logout),
        ],
      ),
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
