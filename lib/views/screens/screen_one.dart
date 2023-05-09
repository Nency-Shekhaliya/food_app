import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/controllers/que_contoller.dart';
import 'package:food_app/helpers/database_helper.dart';
import 'package:food_app/models/cart_model.dart';
import 'package:food_app/views/screens/details_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/cart_controller.dart';

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
  Cartcontroller cartcontroller = Get.put(Cartcontroller());
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: mytabs.length, vsync: this);
  }

  List searchlist = [];
  bool search = false;
  String name = '';
  void serachname(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('all')
        .where('name', isEqualTo: query)
        .get();
    setState(() {
      searchlist = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              indicatorColor: const Color(0xffE12E4B),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: const Color(0xffE12E4B),
              unselectedLabelColor: Colors.grey.shade500,
              labelStyle: GoogleFonts.alegreya(
                  fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 2),
              controller: tabController,
              tabs: [
                const Tab(
                  text: "All",
                ),
                const Tab(
                  text: "Fast food",
                ),
                const Tab(
                  text: "Fruit",
                ),
              ]),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Color(0xffE12E4B),
              size: 27,
            ),
          ),
          title: Text(
            "Foodies",
            style: GoogleFonts.alegreya(
                letterSpacing: 3,
                color: const Color(0xffE12E4B),
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: const Color(0xffE12E4B).withOpacity(0.3),
                  shape: BoxShape.circle),
              child: const Icon(
                Icons.person,
                size: 30,
                color: Color(0xffE12E4B),
              ),
            ),
            const SizedBox(
              width: 10,
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
                    onChanged: (query) {
                      setState(() {
                        serachname(query);
                      });
                    },
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const OutlineInputBorder(
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
                          return const Center(
                            child: Text("No data Available"),
                          );
                        } else {
                          List<QueryDocumentSnapshot<Map<String, dynamic>>>
                              alldata = data.docs;
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: GridView.builder(
                              itemCount: alldata.length,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Details_page(
                                      rating: alldata[index].data()['rating'],
                                      name: alldata[index].data()['name'],
                                      price: alldata[index].data()['price'],
                                      image: alldata[index].data()['image'],
                                      des: alldata[index].data()['des'],
                                    ),
                                  ));
                                },
                                child: productbox(
                                  data: Cartmodel(
                                    name: alldata[index].data()['name'],
                                    price: alldata[index].data()['price'],
                                    image: alldata[index].data()['image'],
                                    que: alldata[index].data()['que'],
                                  ),
                                  image: alldata[index].data()['image'],
                                  name: alldata[index].data()['name'],
                                  price: alldata[index].data()['price'],
                                ),
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
                        return const Center(
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
                    return const Text("No data Available");
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
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => Details_page(
                                            rating:
                                                alldata[index].data()['rating'],
                                            name: alldata[index].data()['name'],
                                            price:
                                                alldata[index].data()['price'],
                                            image:
                                                alldata[index].data()['image'],
                                            des: alldata[index].data()['des'],
                                          )),
                                );
                              },
                              child: productbox(
                                  image: alldata[index].data()['image'],
                                  name: alldata[index].data()['name'],
                                  price: alldata[index].data()['price'],
                                  data: Cartmodel(
                                    que: alldata[index].data()['que'],
                                    name: alldata[index].data()['name'],
                                    price: alldata[index].data()['price'],
                                    image: alldata[index].data()['image'],
                                  )));
                        },
                      ),
                    );
                  }
                } else {
                  return const Center(
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
                    return const Text("No data Available");
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
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Details_page(
                                          rating:
                                              alldata[index].data()['rating'],
                                          name: alldata[index].data()['name'],
                                          price: alldata[index].data()['price'],
                                          image: alldata[index].data()['image'],
                                          des: alldata[index].data()['des'],
                                        )),
                              );
                            },
                            child: productbox(
                                image: alldata[index].data()['image'],
                                name: alldata[index].data()['name'],
                                price: alldata[index].data()['price'],
                                data: Cartmodel(
                                  que: alldata[index].data()['que'],
                                  name: alldata[index].data()['name'],
                                  price: alldata[index].data()['price'],
                                  image: alldata[index].data()['image'],
                                )),
                          );
                        },
                      ),
                    );
                  }
                } else {
                  return const Center(
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
      required Cartmodel data}) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          margin: const EdgeInsets.only(
            left: 5,
            right: 5,
          ),
          height: 154,
          decoration: BoxDecoration(
            color: const Color(0xffE12E4B).withOpacity(0.2),
            borderRadius: const BorderRadius.only(
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
                    color: const Color(0xffE12E4B).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          padding: const EdgeInsets.only(left: 10, right: 5),
          height: 65,
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffE12E4B).withOpacity(0.3)),
            borderRadius: const BorderRadius.only(
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
                    cartcontroller.addcart(data: data);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Add to Cart ")));

                    quentity_contoller.one();
                  },
                  icon: const Icon(Icons.add_shopping_cart)),
            ],
          ),
        )
      ],
    );
  }
}
