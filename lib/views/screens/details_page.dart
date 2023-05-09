import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/controllers/cart_controller.dart';
import 'package:food_app/controllers/que_contoller.dart';
import 'package:food_app/models/cart_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Details_page extends StatefulWidget {
  final name;
  final image;
  final price;
  final des;
  final rating;
  const Details_page(
      {Key? key,
      required this.name,
      required this.price,
      required this.image,
      required this.des,
      required this.rating})
      : super(key: key);

  @override
  State<Details_page> createState() => _Details_pageState();
}

class _Details_pageState extends State<Details_page> {
  Quentity_contoller quentity_contoller = Get.find<Quentity_contoller>();
  Cartcontroller cartcontroller = Get.find<Cartcontroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffE12E4B).withOpacity(0.2),
          title: Text(
            "${widget.name}",
            style:
                GoogleFonts.alegreya(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffE12E4B).withOpacity(0.2),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(3),
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          color: Color(0xffE12E4B).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: MemoryImage(base64Decode(widget.image)),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 10, left: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.name}",
                            style: GoogleFonts.alegreya(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Rs. ${widget.price}.00/-",
                            style: GoogleFonts.alegreya(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 5, right: 5, top: 50),
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(
                        color: Color(0xffE12E4B).withOpacity(0.2),
                      )),
                    ),
                    child: Text(
                      "${widget.rating} ⭐",
                      style: GoogleFonts.alegreya(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 5, right: 5, top: 50),
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(
                        color: Color(0xffE12E4B).withOpacity(0.2),
                      )),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            quentity_contoller.quedecriment();
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Color(0xffE12E4B),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Color(0xffE12E4B))),
                          child: GetBuilder<Quentity_contoller>(
                              builder: (context) {
                            return Text(
                                "${quentity_contoller.quentity_models.que}",
                                style: GoogleFonts.poppins(
                                    fontSize: 15, fontWeight: FontWeight.bold));
                          }),
                        ),
                        IconButton(
                          onPressed: () {
                            quentity_contoller.queincriment();
                          },
                          icon: Icon(
                            Icons.add,
                            color: Color(0xffE12E4B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 5, right: 5, top: 50),
                    height: 50,
                    width: 100,
                    child: Text(
                      "25 min ⌚",
                      style: GoogleFonts.alegreya(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 10),
                height: 30,
                width: double.infinity,
                child: Text(
                  "About Food",
                  style: GoogleFonts.alegreya(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 50),
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Text(
                  "${widget.des}",
                  style: GoogleFonts.alegreya(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey.shade600),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Cartmodel data = Cartmodel(
                    name: widget.name,
                    price: widget.price,
                    image: widget.image,
                    que: quentity_contoller.quentity_models.que,
                  );
                  cartcontroller.addcartlist.add(data);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Add to Cart ")));

                  quentity_contoller.one();
                },
                child: Container(
                  margin: EdgeInsets.only(top: 80),
                  alignment: Alignment.center,
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xffE12E4B),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Text(
                    "Add to cart 🛒",
                    style: GoogleFonts.alegreya(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                        letterSpacing: 3),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
