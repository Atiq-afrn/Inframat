import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';

import 'package:http/http.dart' as http;
import 'package:inframat/models/operator_login_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class OperatorLoginProvider extends ChangeNotifier {
  OperatorLoginModel? _operatorLogin;
  OperatorLoginModel? get getoperatorlogin => _operatorLogin;
  Future<OperatorLoginModel?> getOperatorLogin(
    String mobileno,
    String password,
  ) async {
    print("Connection===${await AppStorage.getConnectionId()}");
    final response = await http.post(
      Uri.parse(ConstApi.operatorLogin),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "mobile_no": mobileno,
        "password": password,
      },
    );

    print(response.body);
    if (response.statusCode == 200) {
      _operatorLogin = OperatorLoginModel.fromJson(jsonDecode(response.body));
    } else {
      print("network error");
    }
    notifyListeners();
    return _operatorLogin;
  }
}
