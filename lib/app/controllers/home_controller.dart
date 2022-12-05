import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/routes_modal.dart';

class HomeController extends GetxController {
  Rx<String> screen = Rx<String>('home');
  Rx<List<RoutesModal>> routesList = Rx<List<RoutesModal>>([]);
  List<RoutesModal> get routes => routesList.value;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    routesList.bindStream(readRoutes());

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

  Stream<List<RoutesModal>> readRoutes() {
    return FirebaseFirestore.instance
        .collection('routes')
        .snapshots()
        .map((snapshot) {
      List<RoutesModal> routes = [];
      for (var messageData in snapshot.docs) {
        routes.add(RoutesModal.fromMap(messageData.data() as dynamic));
      }

      return routes;
    });
  }
}
