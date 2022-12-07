import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coletapp/app/controllers/home_controller.dart';
import 'package:coletapp/app/routes/app_routes.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateComplaintPage extends StatefulWidget {
  const CreateComplaintPage({super.key});

  @override
  State<CreateComplaintPage> createState() => _CreateComplaintPageState();
}

class _CreateComplaintPageState extends State<CreateComplaintPage> {
  @override
  final controller = Get.put(HomeController());
  String image = '';
  String? district;
  String? street;

  String? urlImage;
  final descricao = TextEditingController();

  createComplaint() async {
    await FirebaseFirestore.instance.collection("complaints").add({
      "image": image,
      "district": district,
      "street": street,
      "description": descricao.value.text,
      "date": Timestamp.now(),
    }).then((value) {
      Get.toNamed(Routes.COMPLAINTS);
      controller.readComplaints();
    });
  }

  getImage(String url) {
    setState(() {
      image = url;
    });
  }

  Future<void> upload(String path) async {
    File file = File(path);
    FirebaseStorage storage = FirebaseStorage.instance;
    String ref = 'complaints/${DateTime.now()}.jpg';
    await storage.ref(ref).putFile(file).then(
        (_) => storage.ref(ref).getDownloadURL().then((url) => getImage(url)));
  }

  Future<XFile?> getImageGallery() async {
    final ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      await upload(file.path);
    }
    return null;
  }

  Future<XFile?> getImageCamera() async {
    final ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.camera);
    if (file != null) {
      await upload(file.path);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Fazer denúncia',
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _showModal,
                    child: Container(
                        width: double.infinity,
                        height: 300,
                        color: const Color.fromARGB(255, 230, 228, 228),
                        child: image == ''
                            ? const Icon(
                                Icons.add_a_photo_outlined,
                                size: 80,
                                color: Colors.green,
                              )
                            : Image.network(image)),
                  ),
                 
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButton(
                        dropdownColor: Colors.white,
                        focusColor: Colors.transparent,
                        hint: const Text(
                          'Rua',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        itemHeight: 70,
                        isExpanded: true,
                        value: street,
                        items: controller.routesList.map((route) {
                          return DropdownMenuItem(
                            value: route.street,
                            child: Text(route.street!),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            street = newValue;
                          });
                        }),
                  ),
                   Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: DropdownButton(
                          dropdownColor: Colors.white,
                          focusColor: Colors.transparent,
                          hint: const Text(
                            'Bairro',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          itemHeight: 70,
                          isExpanded: true,
                          value: district,
                          items: controller.routesList.map((route) {
                            return DropdownMenuItem(
                              value: route.district,
                              child: Text(route.district!),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              district = newValue;
                            });
                          })),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: descricao,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 1,
                      maxLength: 300,
                      textInputAction: TextInputAction.newline,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo invalido. confira e tente novamente';
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Denúncia',
                        errorStyle: TextStyle(
                          color: Colors.red,
                        ),
                        labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        border: UnderlineInputBorder(),
                      ),
                      cursorColor: Colors.black,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green)),
                        onPressed: () => createComplaint(),
                        child: const Text('Fazer')),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  _showModal() => showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      context: context,
      builder: (context) => SizedBox(
            height: 200,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Adicionar Imagem',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const Divider(height: 2),
                ListTile(
                  iconColor: Colors.green,
                  title: const Text('Camera'),
                  leading: const Icon(Icons.camera_alt_outlined),
                  onTap: getImageCamera,
                ),
                ListTile(
                  iconColor: Colors.green,
                  title: const Text('Galeria'),
                  leading: const Icon(
                    Icons.image_outlined,
                  ),
                  onTap: getImageGallery,
                ),
              ],
            ),
          ));
}
