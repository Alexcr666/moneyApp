class modelLocationCountry {
  final int id;
  final String name;
  final String level;

  // final modelInvitedOrder order;

  modelLocationCountry({this.id, this.name, this.level
      //this.order,
      });

  factory modelLocationCountry.fromJson(Map<String, dynamic> json) {
    return modelLocationCountry(
      id: json['id'],
      name: json["name"].toString(),
      level: json["level"].toString(),
    );
  }

  static List<modelLocationCountry> listFromJson(List<dynamic> json) {
    return json == null
        ? List<modelLocationCountry>()
        : json.map((value) => modelLocationCountry.fromJson(value)).toList();
  }
}
