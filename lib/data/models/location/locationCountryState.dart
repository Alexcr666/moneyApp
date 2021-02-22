class modelLocationCountryState {
  final int id;
  final String name;
  final String level;

  // final modelInvitedOrder order;

  modelLocationCountryState({this.id, this.name, this.level
      //this.order,
      });

  factory modelLocationCountryState.fromJson(Map<String, dynamic> json) {
    return modelLocationCountryState(
      id: json['id'],
      name: json["name"].toString(),
      level: json["level"].toString(),
    );
  }

  static List<modelLocationCountryState> listFromJson(List<dynamic> json) {
    return json == null
        ? List<modelLocationCountryState>()
        : json
            .map((value) => modelLocationCountryState.fromJson(value))
            .toList();
  }
}
