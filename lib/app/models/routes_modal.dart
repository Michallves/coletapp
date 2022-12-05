import 'package:cloud_firestore/cloud_firestore.dart';

class RoutesModal {
  final String? address;

  RoutesModal({this.address});

  RoutesModal.fromMap(Map<String, dynamic> map) : address = map['address'];

  Map toMap() {
    return {
      'address': address,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      "address": address,
    };
  }

  factory RoutesModal.fromJson(Map<String, dynamic> json) {
    return RoutesModal(
      address: json["address"],
    );
  }
}
