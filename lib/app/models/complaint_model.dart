import 'package:cloud_firestore/cloud_firestore.dart';

class ComplaintModel {
  final String? image;
  final String? district;
  final String? street;
  final String? description;
  final Timestamp? date;

  ComplaintModel({this.image, this.district, this.street, this.description, this.date});

  Map<String, dynamic> toJson() {
    return {
      "image": image,
      "district": district,
      "street": street,
      "des": description,
      "date": date,
    };
  }

  factory ComplaintModel.fromJson(Map<String, dynamic> json) {
    return ComplaintModel(
      image: json["image"],
      district: json["district"],
      street: json["street"],
      description: json["description"],
      date: json["date"],
    );
  }
}
