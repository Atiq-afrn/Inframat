import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/operator_logout_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class OperatorLogOutProvider extends ChangeNotifier {
  OperatorLogOutModel? _operatorLogout;
  OperatorLogOutModel? get operatorLogout => _operatorLogout;
  final client = LoggingHttpClient();
  Future<OperatorLogOutModel?> getoperatorLogout() async {
    final response = await client.post(
      Uri.parse("${ConstApi.operatorLogoutapi}"),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      _operatorLogout = OperatorLogOutModel.fromJson(jsonDecode(response.body));
    } else {
      print("Error: ${response.statusCode}");
    }
    notifyListeners();
    return _operatorLogout;
  }
}
