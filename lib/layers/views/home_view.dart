import 'package:coletapp/core/routes/app_routes.dart';
import 'package:coletapp/layers/models/complaint_model.dart';
import 'package:coletapp/layers/views/widgets/complaint_widget.dart';
import 'package:coletapp/layers/views/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class ComplaintsView extends StatelessWidget {
  ComplaintsView({super.key});
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.CREATECOMPLAINT),
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(title: const Text("Denúncias"), actions: [
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
              ? ListView.separated(
                
                  shrinkWrap: true,
                  itemCount: controller.complaintsList.length,
                  separatorBuilder: (_, ___) => const Divider(
                        height: 2,
                      ),
                  itemBuilder: ((context, index) {
                    final ComplaintModel complaint =
                        controller.complaintsList[index];
                    return Complaintwidget(
                      image: complaint.image,
                      description: complaint.description,
                      district: complaint.district,
                      street: complaint.street,
                      date: complaint.date,
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
