class ForgetPasswordModel {
  final String message;
  final int otp;

  ForgetPasswordModel({required this.message, required this.otp});

  factory ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordModel(
      message: json['message'] ?? '',
      otp: json['otp'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'otp': otp};
  }
}
