import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';

class Cartcontroller extends GetxController {
  List addcartlist = [];

  get totalQuantity {
    int Quantity = 0;

    addcartlist.forEach((element) {
      Quantity += element.que as int;
    });

    return Quantity;
  }

  get totalprice {
    int totalprice = 0;

    addcartlist.forEach((element) {
      totalprice += (element.que as int) * (element.price as int);
    });

    return totalprice;
  }

  search(String name) {
    FirebaseFirestore.instance.collection('all').where('name').get();
  }

  addcart({required Cartmodel data}) {
    addcartlist.add(data);
    update();
  }

  removecart({required Cartmodel data}) {
    addcartlist.remove(data);
    update();
  }
}
