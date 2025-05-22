import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inframat/models/contractor_login_model.dart';

class LoginService {
  ContractorLoginModel? contractorlogin;
  Future<ContractorLoginModel?> loginwithemail() async {
    final response = await http.post(
      Uri.parse(
        "http://inframart.goproject.in/api/contractor/login_contractor",
      ),
      body: {"username": "gaurav0023@gmail.com", "password": "1234567890"},
    );

    if (response.statusCode == 200) {
      contractorlogin = ContractorLoginModel.fromJson(
        jsonDecode(response.body),
      );
    }
    return contractorlogin;
  }
}
