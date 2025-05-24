import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/forget_password_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class ForgetpasswordProvider extends ChangeNotifier {
  ForgetPasswordModel? _forgetPasswordModel;
  ForgetPasswordModel? get forgetPasswordModel => _forgetPasswordModel;
  final client = LoggingHttpClient();
  Future<ForgetPasswordModel?> getPassword(String mobileNo) async {
    final response = await client.post(
      Uri.parse(ConstApi.forgetPasswordApi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),

        "mobile_no": mobileNo,
      },
    );

    print(response.body);
    if (response.statusCode == 200) {
      _forgetPasswordModel = ForgetPasswordModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      print("Error:${response.statusCode}");
    }
    notifyListeners();
    return _forgetPasswordModel;
  }
}
