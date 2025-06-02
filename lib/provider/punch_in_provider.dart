import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/models/punch_in_model.dart';
import 'package:http/http.dart' as http;
import 'package:inframat/shared_pref/shared_preferance.dart';

class PunchInProvider extends ChangeNotifier {
  PunchInModel? _operatorpunchIn;
  PunchInModel? get operatorPunchIn => _operatorpunchIn;

  Future<PunchInModel?> getOperatorPunchIn(
    String? operatorImage,
    dynamic lat,
    dynamic long,
  ) async {
    final response = await http.post(
      Uri.parse("${ConstApi.operatorPunchIn}"),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
        "lat": lat,
        "long": long,
        "image": operatorImage,
      },
    );

    print(response.body.toString());
    if (response.statusCode == 200) {
      _operatorpunchIn = PunchInModel.fromJson(jsonDecode(response.body));
      print("punch in successfull");
    }

    return _operatorpunchIn;
  }
}
