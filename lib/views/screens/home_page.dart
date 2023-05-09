import 'package:flutter/material.dart';
import 'package:food_app/controllers/cart_controller.dart';
import 'package:food_app/controllers/que_contoller.dart';
import 'package:food_app/views/screens/cart_page.dart';
import 'package:food_app/views/screens/screen_one.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  Quentity_contoller quentity_contoller = Get.put(Quentity_contoller());
  Cartcontroller cartcontroller = Get.put(Cartcontroller());
  int currentindex = 0;
  final List screens = [const Screen_1(), const Cart_Page(), Container()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screens[currentindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: const IconThemeData(
          color: Color(0xffE12E4B),
        ),
        currentIndex: currentindex,
        elevation: 20,
        iconSize: 25,
        selectedFontSize: 12,
        selectedLabelStyle:
            GoogleFonts.alegreya(fontSize: 14, fontWeight: FontWeight.bold),
        showUnselectedLabels: false,
        showSelectedLabels: true,
        selectedItemColor: const Color(0xffE12E4B),
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              activeIcon: Icon(Icons.home),
              backgroundColor: Color(0xffE12E4B)),
          BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 14,
                    width: 18,
                    decoration: const BoxDecoration(
                        color: Color(0xffE12E4B), shape: BoxShape.circle),
                    child: GetBuilder<Cartcontroller>(builder: (context) {
                      return Text(
                        "${cartcontroller.addcartlist.length}",
                        style:
                            const TextStyle(fontSize: 10, color: Colors.white),
                      );
                    }),
                  ),
                  const Icon(Icons.shopping_cart_outlined),
                ],
              ),
              label: "Cart",
              activeIcon: const Icon(Icons.shopping_cart),
              backgroundColor: const Color(0xffE12E4B)),
          const BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active_outlined),
              label: "Notifications",
              activeIcon: Icon(Icons.notifications_active),
              backgroundColor: Color(0xffE12E4B)),
        ],
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
      ),
    );
  }
}
