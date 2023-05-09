import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/models/que_models.dart';
import 'package:get/get.dart';

class Quentity_contoller extends GetxController {
  List<QueryDocumentSnapshot<Map<String, dynamic>>> addedproduct = [];

  Quentity_models quentity_models = Quentity_models(que: 1);
  queincriment() {
    quentity_models.que++;
    update();
  }

  quedecriment() {
    (quentity_models.que > 1) ? quentity_models.que-- : null;
    update();
  }

  void removedata({required QueryDocumentSnapshot<Map<String, dynamic>> data}) {
    addedproduct.remove(data);
    update();
  }

  one() {
    quentity_models.que = 1;
    update();
  }
}
