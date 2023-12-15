import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coletapp/core/routes/app_routes.dart';
import 'package:coletapp/core/utils/util.dart';
import 'package:coletapp/layers/controllers/home_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateComplaintView extends StatefulWidget {
  const CreateComplaintView({super.key});

  @override
  State<CreateComplaintView> createState() => _CreateComplaintViewState();
}

class _CreateComplaintViewState extends State<CreateComplaintView> {
  @override
  final controller = Get.put(HomeController());
  String image = '';
  String? district;
  String? street;

  String? urlImage;
  final descricao = TextEditingController();
  final formKey = GlobalKey<FormState>();

  createComplaint() async {
    if (formKey.currentState!.validate()) {
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
          child: Form(
            key: formKey,
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
                                  color: Color.fromARGB(255, 255, 183, 0),
                                )
                              : Image.network(image)),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: DropdownButtonFormField<String>(
                        dropdownColor: Colors.white,
                        focusColor: Colors.transparent,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        itemHeight: 70,
                        isExpanded: true,
                        validator: (value) => Validators.combine(
                            [() => Validators.isNotSelected(value)]),
                        value: street,
                        items: controller.routesList.map((route) {
                          return DropdownMenuItem<String>(
                            value: route.street!,
                            child: Text(route.street!),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            street = newValue;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Rua",
                          labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 255, 183, 0)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.error),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: DropdownButtonFormField<String>(
                        dropdownColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        isExpanded: true,
                        validator: (value) => Validators.combine(
                            [() => Validators.isNotSelected(value)]),
                        itemHeight: 70,
                        value: district,
                        items: controller.routesList.map((route) {
                          return DropdownMenuItem<String>(
                            value: route.district!,
                            child: Text(route.district!),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            district = newValue;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Bairro",
                          labelStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 255, 183, 0)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.error),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: descricao,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        minLines: 1,
                        maxLength: 300,
                        textInputAction: TextInputAction.newline,
                        validator: (value) => Validators.combine(
                            [() => Validators.isNotEmpty(value)]),
                        decoration: InputDecoration(
                          labelText: 'Denúncia',
                          errorStyle: const TextStyle(
                            color: Colors.red,
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 255, 183, 0)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.error),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
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
                              backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 255, 183, 0))),
                          onPressed: () => createComplaint(),
                          child: const Text('Salvar')),
                    )
                  ],
                ),
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
                  iconColor: const Color.fromARGB(255, 255, 183, 0),
                  title: const Text('Camera'),
                  leading: const Icon(Icons.camera_alt_outlined),
                  onTap: getImageCamera,
                ),
                ListTile(
                  iconColor: const Color.fromARGB(255, 255, 183, 0),
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
