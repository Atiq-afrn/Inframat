import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/dashboard_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class DashboardProcessProvider extends ChangeNotifier {
  ProcessStageResponseModel? _processStageResponseModel;
  ProcessStageResponseModel? get processState => _processStageResponseModel;
  final client = LoggingHttpClient();
  Future<ProcessStageResponseModel?> gettingDashBoardItems() async {
    final response = await client.post(
      Uri.parse(ConstApi.dashboardApi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
        "machine_id": await AppStorage.gettingMachineId(),
      },
    );
    if (response.statusCode == 200) {
      _processStageResponseModel = ProcessStageResponseModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      print("Error ${response.statusCode}");
    }
    notifyListeners();
    return _processStageResponseModel;
  }
}
