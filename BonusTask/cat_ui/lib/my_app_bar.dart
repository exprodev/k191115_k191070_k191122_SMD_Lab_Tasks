import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Image.asset(
              'assets/images/cat_logo_2.png',
              width: 30,
              height: 30,
              fit: BoxFit
                  .contain, // Adjust this value to achieve the desired result
            ),
          ),
          Text(
            'Kitty-Fy',
            style: GoogleFonts.pacifico(
              textStyle: TextStyle(
                fontSize: 20,
                // foreground: Paint()
                //   ..style = PaintingStyle.stroke
                //   ..strokeWidth = 2
                //   ..color = Colors.white,
              ),
            ),
          ),
        ],
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 71, 71, 71),
              Color.fromARGB(255, 44, 44, 43)
            ], // Replace with your desired gradient colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}