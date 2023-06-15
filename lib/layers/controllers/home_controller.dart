import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coletapp/layers/models/complaint_model.dart';
import 'package:get/get.dart';

import '../models/route_model.dart';

class HomeController extends GetxController {
  RxBool isLoading = RxBool(false);

  RxList<RoutesModal> routesList = RxList<RoutesModal>([]);
  RxList<ComplaintModel> complaintsList = RxList<ComplaintModel>([]);

  @override
  void onInit() {
    readRoutes();
    readComplaints();
    super.onInit();
  }

  readRoutes() async {
    isLoading.value = true;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      await firestore
          .collection("routes")
          .orderBy("street", descending: false)
          .get()
          .then((doc) {
        for (var doc in doc.docs) {
          routesList.add(RoutesModal.fromJson(doc.data()));
        }
      });
    } finally {
      isLoading.value = false;
    }
  }

  readComplaints() async {
    complaintsList.clear();
    isLoading.value = true;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      await firestore
          .collection("complaints")
          .orderBy("date", descending: false)
          .get()
          .then((doc) {
        for (var doc in doc.docs) {
          complaintsList.add(ComplaintModel.fromJson(doc.data()));
        }
      });
    } finally {
      isLoading.value = false;
    }
  }
}
