import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/tubemill_recoveryprocess_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class TubemillrecoveryprocessProvider extends ChangeNotifier {
  TubeMillRecoveryprocessModel? _tubemillrecoveryproces;
  TubeMillRecoveryprocessModel? get tubemilldata => _tubemillrecoveryproces;
  final client = LoggingHttpClient();
  Future<TubeMillRecoveryprocessModel?> gettingtubemillRecoveryprocess(
    TubeMillReportData? data,
  ) async {
    final response = await client.post(
      Uri.parse(ConstApi.tubemillRecoveryProcessApi),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
        "tube_mill_id": "1",
        "open": data?.open,
        "joint": data?.joint,
        "zinc_black": data?.zincBlack,
        "pinhole": data?.pinhole,
        "tool_problem": data?.toolProblem,
        "bend": data?.bend,
        "babri": data?.babri,
        "accumulator_scrap": data?.accumulatorScrap,
      }),
    );
    if (response.statusCode == 201) {
      _tubemillrecoveryproces = TubeMillRecoveryprocessModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      print("Error : ${response.statusCode}");
    }

    notifyListeners();
    return _tubemillrecoveryproces;
  }
}
