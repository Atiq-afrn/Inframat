class OperatorLogOutModel {
  final String status;
  final String message;

  OperatorLogOutModel({required this.status, required this.message});

  factory OperatorLogOutModel.fromJson(Map<String, dynamic> json) {
    return OperatorLogOutModel(
      status: json['status'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message};
  }
}
