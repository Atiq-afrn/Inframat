class InvardModel1 {
  final String? status;
  final int? inwardId;
  final String? message;

  InvardModel1({this.status, this.inwardId, this.message});

  // Factory constructor to create an instance from JSON
  factory InvardModel1.fromJson(Map<String, dynamic> json) {
    return InvardModel1(
      status: json['status'],
      inwardId: json['inward_id'],
      message: json['message'],
    );
  }

  // Convert the object back to JSON (optional)
  Map<String, dynamic> toJson() {
    return {'status': status, 'inward_id': inwardId, 'message': message};
  }
}
