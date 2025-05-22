import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:inframat/models/contractor_login_model.dart';
import 'package:http/http.dart' as http;

class LoginProvider extends ChangeNotifier {
  ContractorLoginModel? _contractorlogin;
  ContractorLoginModel? get contractorLogin => _contractorlogin;
  Future<ContractorLoginModel?> getLogin(
    String username,
    String password,
  ) async {
    //  print("${username}+user");

    //  print("${password}+password");

    final response = await http.post(
      Uri.parse(
        "http://inframart.goproject.in/api/contractor/login_contractor",
      ),
      body: {"username": username, "password": password},
    );

    print(response.body);

    if (response.statusCode == 200) {
      _contractorlogin = ContractorLoginModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      print("password or email are incorrect");
    }
    notifyListeners();
    return _contractorlogin;
  }
}
