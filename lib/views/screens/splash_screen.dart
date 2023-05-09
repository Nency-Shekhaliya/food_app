import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<AlignmentGeometry> animation;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    animation = Tween<AlignmentGeometry>(
            begin: Alignment.centerLeft, end: Alignment.center)
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.easeInOutBack));

    animationController.repeat(reverse: false);
    Timer(Duration(seconds: 4), () {
      Get.toNamed("/Login_screen");
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE12E4B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AlignTransition(
              alignment: animation,
              child: Image.asset(
                "assets/images/deliveryboy.png",
                height: 80,
              ),
            ),
            Text(
              "Foodies",
              style: GoogleFonts.aladin(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 5),
            )
          ],
        ),
      ),
    );
  }
}
