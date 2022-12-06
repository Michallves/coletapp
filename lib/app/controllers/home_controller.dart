import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coletapp/app/models/complaint_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/route_model.dart';

class HomeController extends GetxController {
  RxBool isLoading = RxBool(false);
  Rx<String> screen = Rx<String>('routes');

  RxList<RoutesModal> routesList = RxList<RoutesModal>([]);
  RxList<ComplaintModel> complaintsList = RxList<ComplaintModel>([]);

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    readRoutes();
    readComplaints();
    super.onInit();
  }

  toggleDrawer() async {
    if (scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    } else {
      scaffoldKey.currentState!.openDrawer();
    }
  }

  screenTitle() {
    toggleDrawer();

    if (screen == 'home') {
      return 'Inicio';
    } else if (screen == 'complaints') {
      return 'Dénuncias';
    } else if (screen == 'routes') {
      return 'Rotas';
    } else {
      return '';
    }
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
          ;
        }
      });
    } finally {
      isLoading.value = false;
    }
  }

  readComplaints() async {
    isLoading.value = true;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      await firestore.collection("complaints").get().then((doc) {
        for (var doc in doc.docs) {
          complaintsList.add(ComplaintModel.fromJson(doc.data()));
          ;
        }
      });
    } finally {
      isLoading.value = false;
    }
  }
}
