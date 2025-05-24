import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/new_password_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class NewPasswordProvider extends ChangeNotifier {
  NewPasswordModel? _newPasswordModel;
  NewPasswordModel? get newPasswordModel => _newPasswordModel;
  final client = LoggingHttpClient();
  Future<NewPasswordModel?> gettingNewPassword(
    String newPassword,
    String confirmPassword,
  ) async {
    final response = await client.post(
      Uri.parse(ConstApi.reSetPassword),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "mobile_no": "8707435104",
        "new_password": newPassword,
        "confirm_password": confirmPassword,
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      _newPasswordModel = NewPasswordModel.fromJson(jsonDecode(response.body));
    } else {
      print("Error: ${response.statusCode}");
    }

    notifyListeners();
    return _newPasswordModel;
  }
}
