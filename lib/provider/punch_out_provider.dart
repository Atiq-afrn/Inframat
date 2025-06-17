import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/models/punch_in_model.dart';
import 'package:inframat/models/punchout_model.dart';
import 'package:http/http.dart' as http;
import 'package:inframat/shared_pref/shared_preferance.dart';

class PunchOutProvider extends ChangeNotifier {
  PunchOutModel? _punchOutOperator;
  PunchOutModel? get punchOutOperator => _punchOutOperator;

  Future<PunchOutModel?> getPunchOut(String base64PunchOutImage) async {
    final response = await http.post(
      Uri.parse(ConstApi.punchOutOperator),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
        "lat": await AppStorage.gettingLatitude(),
        "long": await AppStorage.gettingLongitude(),
        "image": base64PunchOutImage,
        "date": "10",
        "month": "04",
        "year": "2025",
      },
    );

    print(response.body);
    if (response.statusCode == 200) {
      _punchOutOperator = PunchOutModel.fromJson(jsonDecode(response.body));

      print("puncout successful");
    }
    notifyListeners();
    return _punchOutOperator;
  }
}
