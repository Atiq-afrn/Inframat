import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/tubemillplanmodel.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class TubemillPlanProvider extends ChangeNotifier {
  TubeMillPlanResponseModel? _tubeMillPlanResponseModel;
  TubeMillPlanResponseModel? get tubemillplanresponseModel =>
      _tubeMillPlanResponseModel;

  final client = LoggingHttpClient();
  Future<TubeMillPlanResponseModel?> gettingtubeMillplanlist() async {
    final response = await client.post(
      Uri.parse(ConstApi.tubeMillPlanListApi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
        "search": "",
      },
    );
    if (response.statusCode == 200) {
      _tubeMillPlanResponseModel = TubeMillPlanResponseModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      print("Error: ${response.statusCode}");
    }
    notifyListeners();
    return _tubeMillPlanResponseModel;
  }
}
