import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/login_helper.dart';

class Signup_Page extends StatefulWidget {
  const Signup_Page({Key? key}) : super(key: key);

  @override
  State<Signup_Page> createState() => _Signup_PageState();
}

class _Signup_PageState extends State<Signup_Page> {
  String? email;
  String? password;
  String? username;

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  GlobalKey<FormState> signupkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: double.infinity,
                  child: Image.network(
                    "https://img.onmanorama.com/content/dam/mm/en/food/features/images/2021/10/17/pizza.jpg.transform/schema-16x9/image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 20, bottom: 10, top: 20, right: 20),
                  height: 550,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                    ),
                  ),
                  child: Form(
                    key: signupkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign Up",
                          style: GoogleFonts.aladin(
                              fontWeight: FontWeight.bold,
                              color: const Color(0xffE12E4B),
                              fontSize: 30,
                              letterSpacing: 2),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Enter Username",
                          style: GoogleFonts.alegreya(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              letterSpacing: 1),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        TextFormField(
                          controller: namecontroller,
                          cursorColor: Colors.black,
                          cursorWidth: 1.5,
                          cursorHeight: 22,
                          textInputAction: TextInputAction.next,
                          onSaved: (val) {
                            setState(() {
                              username = val;
                            });
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter name";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1)),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.5),
                              ),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 1.5)),
                              hintText: "Enter name here",
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade400)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Enter Email",
                          style: GoogleFonts.alegreya(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              letterSpacing: 1),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        TextFormField(
                          controller: emailcontroller,
                          cursorColor: Colors.black,
                          cursorWidth: 1.5,
                          cursorHeight: 22,
                          textInputAction: TextInputAction.next,
                          onSaved: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter Email";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1)),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.5),
                              ),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 1.5)),
                              hintText: "Enter email here",
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade400)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Enter Password",
                          style: GoogleFonts.alegreya(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              letterSpacing: 1),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        TextFormField(
                          controller: passwordcontroller,
                          obscureText: true,
                          cursorColor: Colors.black,
                          cursorWidth: 1.5,
                          cursorHeight: 22,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          onSaved: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Please Enter Password";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1)),
                              focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.5),
                              ),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.red, width: 1.5)),
                              hintText: "Enter Password",
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Colors.grey.shade400)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () async {
                              if (signupkey.currentState!.validate()) {
                                signupkey.currentState!.save();
                                Map<String, dynamic> data =
                                    await Firebaseauthhelper
                                        .firebaseauthhelper
                                        .signup(
                                            email: "${email}",
                                            Password: "${password}",
                                            username: '');
                                if (data['user'] != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.green,
                                          content:
                                              Text("Sign Up Successfully")));
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, "\Home_Page", (route) => false);
                                } else if (data['msg'] != null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.red,
                                          behavior: SnackBarBehavior.floating,
                                          content: Text("${data['msg']}")));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          backgroundColor: Colors.red,
                                          behavior: SnackBarBehavior.floating,
                                          content: Text("Sign In Failed")));
                                }
                              }
                              emailcontroller.clear();
                              passwordcontroller.clear();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              alignment: Alignment.center,
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, -1),
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                        color: Colors.pink.shade100),
                                    BoxShadow(
                                        offset: const Offset(0, -1),
                                        blurRadius: 3,
                                        spreadRadius: 1,
                                        color: Colors.pink.shade100)
                                  ],
                                  color: const Color(0xffE12E4B),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.aladin(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18,
                                    letterSpacing: 3),
                              ),
                            ),
                          ),
                        ),
                        Center(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                              Text(
                                "Already create have an account ? ",
                                style: GoogleFonts.alegreya(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      "/Login_screen", (route) => false);
                                },
                                child: Text("Sign In",
                                    style: GoogleFonts.alegreya(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xffE12E4B),
                                    )),
                              )
                            ])),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
