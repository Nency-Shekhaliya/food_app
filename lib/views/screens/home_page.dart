import 'package:flutter/material.dart';
import 'package:food_app/views/screens/cart_page.dart';
import 'package:food_app/views/screens/notification_Page.dart';
import 'package:food_app/views/screens/screen_one.dart';
import 'package:google_fonts/google_fonts.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  int currentindex = 0;
  final List screens = [Screen_1(), Cart_Page(), Noti_page()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screens[currentindex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(
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
        selectedItemColor: Color(0xffE12E4B),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              activeIcon: Icon(Icons.home),
              backgroundColor: Color(0xffE12E4B)),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Cart",
              activeIcon: Icon(Icons.shopping_cart),
              backgroundColor: Color(0xffE12E4B)),
          BottomNavigationBarItem(
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
