class modelStackUser {
  final String id;
  final bool confirmed;
  final bool confirmeddate;
  final bool checked_mobil;
  final bool checked_email;

  // final modelInvitedOrder order;

  modelStackUser({
    this.id,
    this.confirmed,
    this.confirmeddate,
    this.checked_mobil,
    this.checked_email,
    //this.order,
  });

  factory modelStackUser.fromJson(Map<String, dynamic> json) {
    return modelStackUser(
      id: json['id'].toString(),
      confirmed: json["confirmed"],
      confirmeddate: json["confirmeddate"],
      checked_mobil: json["cheked_mobil"],
      checked_email: json["cheked_email"],

      // order: modelInvitedOrder.fromJson(json["order_invitation"]),
    );
  }

  static List<modelStackUser> listFromJson(List<dynamic> json) {
    return json == null
        ? List<modelStackUser>()
        : json.map((value) => modelStackUser.fromJson(value)).toList();
  }
}
