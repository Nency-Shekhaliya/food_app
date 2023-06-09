import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_app/views/screens/home_page.dart';
import 'package:food_app/views/screens/login_screen.dart';
import 'package:food_app/views/screens/screen_one.dart';
import 'package:food_app/views/screens/signup_page.dart';
import 'package:food_app/views/screens/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    getPages: [
      GetPage(name: "/", page: () => const Splash_screen()),
      GetPage(name: "/Login_screen", page: () => const Login_screen()),
      GetPage(name: "/Sign_up", page: () => const Signup_Page()),
      GetPage(name: "/Home_Page", page: () => const Home_Page()),
      GetPage(name: "/Screen_one", page: () => const Screen_1()),
    ],
  ));
}
