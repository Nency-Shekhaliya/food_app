import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/controllers/cart_controller.dart';
import 'package:food_app/controllers/que_contoller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart_Page extends StatefulWidget {
  const Cart_Page({Key? key}) : super(key: key);

  @override
  State<Cart_Page> createState() => _Cart_PageState();
}

class _Cart_PageState extends State<Cart_Page> {
  Quentity_contoller quentity_contoller = Get.find<Quentity_contoller>();
  Cartcontroller cartcontroller = Get.find<Cartcontroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 15,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetBuilder<Cartcontroller>(builder: (context) {
                    return ListView.builder(
                      itemCount: cartcontroller.addcartlist.length,
                      itemBuilder: (context, index) => Card(
                        surfaceTintColor: Colors.pink.shade100,
                        elevation: 3,
                        color: Colors.white,
                        child: ListTile(
                          leading: GetBuilder<Quentity_contoller>(
                              builder: (context) {
                            return Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Color(0xffE12E4B).withOpacity(0.2),
                                ),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: MemoryImage(
                                      base64Decode(cartcontroller
                                          .addcartlist[index].image),
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            );
                          }),
                          title: Text(
                            "${cartcontroller.addcartlist[index].name}",
                            style: GoogleFonts.alegreya(
                                color: Color(0xffE12E4B),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "₹ ${cartcontroller.addcartlist[index].price} * ${cartcontroller.addcartlist[index].que}",
                                style: GoogleFonts.alegreya(
                                    color: Color(0xffE12E4B),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "${"Rs. ${cartcontroller.addcartlist[index].price * cartcontroller.addcartlist[index].que}"}",
                                style: GoogleFonts.alegreya(
                                    color: Color(0xffE12E4B),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          trailing: IconButton(
                              color: Color(0xffE12E4B),
                              onPressed: () {
                                cartcontroller.removecart(
                                    data: cartcontroller.addcartlist[index]);
                              },
                              icon: Icon(
                                Icons.remove_circle_outline,
                                size: 20,
                              )),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 10),
                height: 60,
                width: double.infinity,
                color: Color(0xffE12E4B),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetBuilder<Cartcontroller>(builder: (context) {
                      return Text(
                        "Total Quntity    :   ${cartcontroller.totalQuantity}",
                        style: GoogleFonts.alegreya(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      );
                    }),
                    GetBuilder<Cartcontroller>(builder: (cc) {
                      return Text(
                        "Total Price          :   ${cartcontroller.totalprice}.00/-",
                        style: GoogleFonts.alegreya(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      );
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  quntitybox({required IconData icon}) => Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(left: 7, right: 7),
        height: 18,
        width: 18,
        decoration: BoxDecoration(
            color: Color(0xffE12E4B).withOpacity(0.1),
            borderRadius: BorderRadius.circular(5)),
        child: Icon(
          icon,
          size: 15,
          color: Colors.pink,
        ),
      );
}
