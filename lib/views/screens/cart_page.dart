import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/controllers/que_contoller.dart';
import 'package:get/get.dart';

class Cart_Page extends StatefulWidget {
  const Cart_Page({Key? key}) : super(key: key);

  @override
  State<Cart_Page> createState() => _Cart_PageState();
}

class _Cart_PageState extends State<Cart_Page> {
  Quentity_contoller quentity_contoller = Get.find<Quentity_contoller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: GetBuilder<Quentity_contoller>(builder: (context) {
        return ListView.builder(
          itemCount: quentity_contoller.addedproduct.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              leading: GetBuilder<Quentity_contoller>(builder: (context) {
                return Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: MemoryImage(base64Decode(
                            quentity_contoller.addedproduct[index]['image']))),
                  ),
                );
              }),
              title: Text("${quentity_contoller.addedproduct[index]['name']}"),
              subtitle:
                  Text("₹ ${quentity_contoller.addedproduct[index]['price']}"),
              trailing: IconButton(
                  onPressed: () {
                    quentity_contoller.removedata(
                        data: quentity_contoller.addedproduct[index]);
                  },
                  icon: Icon(Icons.remove_circle_outline)),
            ),
          ),
        );
      }),
    ));
  }
}
