import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_login_api/componen/text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlassBox extends StatefulWidget {
  const GlassBox({super.key});

  @override
  State<GlassBox> createState() => _GlassBoxState();
}

class _GlassBoxState extends State<GlassBox> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        20,
      ),
      child: SizedBox(
        width: 320.w,
        height: 370.h,
        // color: Colors.white,
        child: Stack(
          children: [
            // blur effect
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 100,
                sigmaY: 100,
              ),
              child: Container(),
            ),
            // gradient effect
            Container(
              decoration: BoxDecoration(
                border:
                    Border.all(color: const Color(0xff014872).withOpacity(0.5)),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.white.withOpacity(0.4),
                    ]),
              ),
            ),
            //child
            Padding(
              padding: const EdgeInsets.only(top: 34),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "LOGIN",
                      style: mediumBoldWhite,
                    ),
                  ),
                  25.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      'Username',
                      style: kecilRegulerWhite,
                    ),
                  ),
                  10.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Container(
                      padding: const EdgeInsets.all(1.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10.0), // Radius border circular
                        border: Border.all(
                          color: blueColor, // Warna border
                          width: 1.0, // Lebar border
                        ),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '', // Hint text
                            hintStyle: kecilRegulerWhite),
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      'Password',
                      style: kecilRegulerWhite,
                    ),
                  ),
                  10.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Container(
                      padding: const EdgeInsets.all(1.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: blueColor,
                          width: 1.0,
                        ),
                      ),
                      child: TextField(
                        obscureText:
                            !isPasswordVisible, // Menggunakan ! untuk membalikkan nilai
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '', // Hint text
                          suffixIcon: GestureDetector(
                            onTap: () {
                              // Fungsi untuk mengubah status password terlihat atau tidak
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            child: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: blueColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  30.verticalSpace,
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const BerandaPage(),
                        //   ),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: blueColor,
                        backgroundColor: whiteColor, // Warna teks
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Radius border circular
                          side: BorderSide(
                              color: whiteColor, width: 5.0), // Border
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: kecilBoldBlue,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
