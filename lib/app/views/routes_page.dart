import 'package:coletapp/app/models/route_model.dart';
import 'package:coletapp/app/widgets/drawer.dart';
import 'package:coletapp/app/widgets/route_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class RoutesPage extends StatelessWidget {
  RoutesPage({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rotas'), actions: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          width: 60,
          child: Image.asset(
            'assets/images/coletapp.png',
            fit: BoxFit.contain,
          
          ),
        )
      ]),
      drawer: MainDrawer(),
      body: SafeArea(
          child: Obx(() => controller.isLoading == false
              ? ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: controller.routesList.length,
                  itemBuilder: ((context, index) {
                    final RoutesModal route = controller.routesList[index];
                    return RouteWidget(
                      district: route.district,
                      street: route.street,
                      date: route.date,
                    );
                  }))
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                ))),
    );
  }
}
