import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/models/que_models.dart';
import 'package:get/get.dart';

class Quentity_contoller extends GetxController {
  Quentity_models quentity_models = Quentity_models(que: 1);

  List addedproduct = [];

  // get totalquntity {
  //   int quantity = 0;
  //   addedproduct.forEach((element) {
  //     quantity += element.qun;
  //   });
  //   return quantity;
  // }

  get totalprice {
    double totalp = 0;
    addedproduct.forEach((element) {
      totalp += element.price * element.qun;
    });
    return totalp;
  }

  void addcart({required QueryDocumentSnapshot<Map<String, dynamic>> data}) {
    addedproduct.add(data);
    update();
  }

  void removedata({required QueryDocumentSnapshot<Map<String, dynamic>> data}) {
    addedproduct.remove(data);
    update();
  }
}
