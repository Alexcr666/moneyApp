class modelSignUp {
  final String twilioSid;
  final String id;

  // final modelInvitedOrder order;

  modelSignUp({
    this.twilioSid,
    this.id,
    //this.order,
  });

  factory modelSignUp.fromJson(Map<String, dynamic> json) {
    return modelSignUp(
      id: json['id'].toString(),
      twilioSid: json["twilioSid"].toString(),
      // order: modelInvitedOrder.fromJson(json["order_invitation"]),
    );
  }

  static List<modelSignUp> listFromJson(List<dynamic> json) {
    return json == null
        ? List<modelSignUp>()
        : json.map((value) => modelSignUp.fromJson(value)).toList();
  }
}
