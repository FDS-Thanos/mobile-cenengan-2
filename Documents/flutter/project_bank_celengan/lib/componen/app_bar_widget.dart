import 'package:flutter/material.dart';
import 'package:flutter_login_api/componen/text.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const AppBarWidget({
    super.key,
    required this.text,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFAFAFA),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xff014872),
          ),
          child: Center(
            child: IconButton(
              onPressed: () {
                // Aksi ketika tombol ditekan
                // Misalnya, kembali ke halaman sebelumnya
                Navigator.pop(context);
              },
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: const Color(0xff014872),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 20), // Adjust top padding here
        child: Text(text, style: semiBoldBlue),
      ),
      centerTitle: true, // Center the title
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(
            0.0), // Set the preferred size to remove the bottom space
        child: SizedBox(),
      ),
    );
  }
}
