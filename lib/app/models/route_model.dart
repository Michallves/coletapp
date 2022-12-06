class RoutesModal {
  final String? district;
  final String? street;
  final Map? date;

  RoutesModal({this.district, this.street, this.date});

  Map<String, dynamic> toJson() {
    return {
      "district": district,
      "street": street,
      "date": date
    };
  }

  factory RoutesModal.fromJson(Map<String, dynamic> json) {
    return RoutesModal(
      district: json["district"],
      street: json["street"],
      date: json["date"],
    );
  }
}
