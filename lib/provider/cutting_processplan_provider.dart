import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/cuttingprocess_plan_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class CuttingProcessplanProvider extends ChangeNotifier {
  CuttingProcessPlanResponseModel? _cuttingProcessPlanResponseModel;
  CuttingProcessPlanResponseModel? get cuttingProcessPlanresponseModel =>
      _cuttingProcessPlanResponseModel;

  final client = LoggingHttpClient();
  Future<CuttingProcessPlanResponseModel?> gettingCuttingProcessplan() async {
    final response = await client.post(
      Uri.parse(ConstApi.cuttingProcessplanApi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
        "search": "",
      },
    );
    if (response.statusCode == 200) {
      _cuttingProcessPlanResponseModel =
          CuttingProcessPlanResponseModel.fromJson(jsonDecode(response.body));
    } else {
      print("Error  in cutting process : ${response.statusCode} ");
    }

    notifyListeners();
    return _cuttingProcessPlanResponseModel;
  }
}
