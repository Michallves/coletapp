
class ComplaintModel {
  final String? image;
  final String? district;
  final String? street;
  final String? description;

  ComplaintModel({this.image, this.district, this.street, this.description});

  Map<String, dynamic> toJson() {
    return {
      "image": image,
      "district": district,
      "street": street,
      "des": description
    };
  }

  factory ComplaintModel.fromJson(Map<String, dynamic> json) {
    return ComplaintModel(
      image: json["image"],
      district: json["district"],
      street: json["street"],
      description: json["description"],
    );
  }
}
