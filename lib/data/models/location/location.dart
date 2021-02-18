class modelLocation {
  final String area_code;
  final String city;
  final String continent_code;
  final String coords;
  final String country_code;
  final String country_name;
  final String latitude;
  final String longitude;
  final String region_name;

  // final modelInvitedOrder order;

  modelLocation(
      {this.area_code,
      this.city,
      this.continent_code,
      this.coords,
      this.country_code,
      this.country_name,
      this.latitude,
      this.longitude,
      this.region_name
      //this.order,
      });

  factory modelLocation.fromJson(Map<String, dynamic> json) {
    return modelLocation(
      area_code: json['area_code'].toString(),
      city: json["city"].toString(),
      continent_code: json["continent_code"].toString(),
      coords: json["coords"].toString(),
      country_code: json["country_code"].toString(),
      country_name: json["country_name"].toString(),
      latitude: json["latitude"].toString(),
      longitude: json["longitude"].toString(),
      region_name: json["region_name"].toString(),
      // order: modelInvitedOrder.fromJson(json["order_invitation"]),
    );
  }

  static List<modelLocation> listFromJson(List<dynamic> json) {
    return json == null
        ? List<modelLocation>()
        : json.map((value) => modelLocation.fromJson(value)).toList();
  }
}
