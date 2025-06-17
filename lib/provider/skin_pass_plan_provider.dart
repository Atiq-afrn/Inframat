import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/skin_pass_plan_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class SkinPassPlanProvider extends ChangeNotifier {
  SkinPassPlanResponse? _skinPassPlanResponse;
  SkinPassPlanResponse? get skinpassdata => _skinPassPlanResponse;
  final client = LoggingHttpClient();
  Future<SkinPassPlanResponse?> gettingSkinpass() async {
    final response = await client.post(
      Uri.parse(ConstApi.skinPassPlanlistApi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
      },
    );

    if (response.statusCode == 200) {
      _skinPassPlanResponse = SkinPassPlanResponse.fromJson(
        jsonDecode(response.body),
      );
    } else {
      print("we are not getting 200");
    }
    notifyListeners();
    return _skinPassPlanResponse;
  }
}
