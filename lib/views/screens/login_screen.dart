import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  height: 380,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Log In",
                            style: GoogleFonts.aladin(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffE12E4B),
                                fontSize: 30,
                                letterSpacing: 2),
                          ),
                        ],
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
                        cursorColor: Colors.black,
                        cursorWidth: 1.5,
                        cursorHeight: 22,
                        textInputAction: TextInputAction.done,
                        onSaved: (val) {},
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter Password";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.5),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.5)),
                            hintText: "Enter name here",
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
                        cursorColor: Colors.black,
                        cursorWidth: 1.5,
                        cursorHeight: 22,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onSaved: (val) {},
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter Email";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.5),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.5)),
                            hintText: "Enter Password",
                            hintStyle: TextStyle(
                                fontSize: 14, color: Colors.grey.shade400)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, "\Home_Page", (route) => false);
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            alignment: Alignment.center,
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, -1),
                                      blurRadius: 5,
                                      spreadRadius: 1,
                                      color: Colors.pink.shade100),
                                  BoxShadow(
                                      offset: Offset(0, -1),
                                      blurRadius: 3,
                                      spreadRadius: 1,
                                      color: Colors.pink.shade100)
                                ],
                                color: Color(0xffE12E4B),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Log In",
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
                        child: Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "Don't have an account ? ",
                              style: GoogleFonts.alegreya(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                          TextSpan(
                              text: "Sign up",
                              style: GoogleFonts.alegreya(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffE12E4B),
                              )),
                        ])),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
