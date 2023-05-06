import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/controllers/que_contoller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/database_helper.dart';

class Screen_1 extends StatefulWidget {
  const Screen_1({Key? key}) : super(key: key);

  @override
  State<Screen_1> createState() => _Screen_1State();
}

class _Screen_1State extends State<Screen_1>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List mytabs = [
    "All ",
    "Fast food",
    "Fruit",
  ];
  Quentity_contoller quentity_contoller = Get.put(Quentity_contoller());
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: mytabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              indicatorColor: Color(0xffE12E4B),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Color(0xffE12E4B),
              unselectedLabelColor: Colors.grey.shade500,
              labelStyle: GoogleFonts.alegreya(
                  fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 2),
              controller: tabController,
              tabs: [
                Tab(
                  text: "All",
                ),
                Tab(
                  text: "Fast food",
                ),
                Tab(
                  text: "Fruit",
                ),
              ]),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Color(0xffE12E4B),
              size: 27,
            ),
          ),
          title: Text(
            "Foodies",
            style: GoogleFonts.alegreya(
                letterSpacing: 3,
                color: Color(0xffE12E4B),
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 5,
              ),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.pinkAccent.shade100,
              ),
            )
          ],
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffE12E4B)),
                        ),
                        prefixIcon: Icon(
                          Icons.search_outlined,
                          color: Colors.grey.shade600,
                        ),
                        hintText: 'Search',
                        hintStyle: GoogleFonts.alegreya(
                            color: Colors.grey.shade600, letterSpacing: 2)),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: StreamBuilder(
                    stream: Firestorehelper.firestorehelper.featchallrecord(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("${snapshot.error}"),
                        );
                      } else if (snapshot.hasData) {
                        QuerySnapshot<Map<String, dynamic>>? data =
                            snapshot.data;
                        if (data == null) {
                          return Center(
                            child: Text("No data Available"),
                          );
                        } else {
                          List<QueryDocumentSnapshot<Map<String, dynamic>>>
                              alldata = data.docs;
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: GridView.builder(
                              itemCount: alldata.length,
                              itemBuilder: (context, index) => productbox(
                                data: alldata[index],
                                image: alldata[index].data()['image'],
                                name: alldata[index].data()['name'],
                                price: alldata[index].data()['price'],
                              ),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: MediaQuery.of(context)
                                        .size
                                        .width /
                                    (MediaQuery.of(context).size.height / 1.5),
                              ),
                            ),
                          );
                        }
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Color(0xffE12E4B),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            StreamBuilder(
              stream: Firestorehelper.firestorehelper.featchfoodrecord(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                } else if (snapshot.hasData) {
                  QuerySnapshot<Map<String, dynamic>>? data = snapshot.data;
                  if (data == null) {
                    return Text("No data Available");
                  } else {
                    List<QueryDocumentSnapshot<Map<String, dynamic>>> alldata =
                        data.docs;
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: GridView.builder(
                        itemCount: alldata.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 1.5),
                            crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return productbox(
                              image: alldata[index].data()['image'],
                              name: alldata[index].data()['name'],
                              price: alldata[index].data()['price'],
                              data: alldata[index]);
                        },
                      ),
                    );
                  }
                } else {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Color(0xffE12E4B),
                  ));
                }
              },
            ),
            StreamBuilder(
              stream: Firestorehelper.firestorehelper.featchfruitrecord(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                } else if (snapshot.hasData) {
                  QuerySnapshot<Map<String, dynamic>>? data = snapshot.data;
                  if (data == null) {
                    return Text("No data Available");
                  } else {
                    List<QueryDocumentSnapshot<Map<String, dynamic>>> alldata =
                        data.docs;
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: GridView.builder(
                        itemCount: alldata.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height / 1.5),
                            crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          return productbox(
                              image: alldata[index].data()['image'],
                              name: alldata[index].data()['name'],
                              price: alldata[index].data()['price'],
                              data: alldata[index]);
                        },
                      ),
                    );
                  }
                } else {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Color(0xffE12E4B),
                  ));
                }
              },
            ),
          ],
        ));
  }

  starbox() => Text("⭐⭐⭐⭐⭐",
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.alegreya(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ));
  productbox(
      {required String image,
      required String name,
      required int price,
      required QueryDocumentSnapshot<Map<String, dynamic>> data}) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(2),
          margin: EdgeInsets.only(
            left: 5,
            right: 5,
          ),
          height: 154,
          decoration: BoxDecoration(
            color: Color(0xffE12E4B).withOpacity(0.2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: MemoryImage(
                          base64Decode(image),
                        ),
                        fit: BoxFit.cover),
                    color: Color(0xffE12E4B).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          padding: EdgeInsets.only(left: 10, right: 5),
          height: 65,
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffE12E4B).withOpacity(0.3)),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            color: Colors.white.withOpacity(0.2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.alegreya(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  starbox(),
                  Text(
                    " ₹ ${price.toString()}",
                    style: GoogleFonts.alegreya(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    quentity_contoller.addcart(data: data);
                  },
                  icon: Icon(Icons.add_shopping_cart)),
            ],
          ),
        )
      ],
    );
  }
}
