import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/otp_verification_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class OptVerifyProvider extends ChangeNotifier {
  OtpVerificationModel? _otpVerificationModel;
  OtpVerificationModel? get otpVerificationModel => _otpVerificationModel;

  final client = LoggingHttpClient();
  Future<OtpVerificationModel?> getVerifyOtp(
    String? mobileNo,
    String? otp,
  ) async {
    final respnse = await client.post(
      Uri.parse(ConstApi.verifyotp),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "mobile_no": mobileNo,
        "otp": otp,
      },
    );
    print(respnse.body);
    if (respnse.statusCode == 200) {
      _otpVerificationModel = OtpVerificationModel.fromJson(
        jsonDecode(respnse.body),
      );
    } else {
      print("Error: ${respnse.statusCode}");
    }

    notifyListeners();
    return _otpVerificationModel;
  }
}
