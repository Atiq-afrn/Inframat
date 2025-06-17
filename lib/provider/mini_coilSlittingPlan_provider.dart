import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/mini_coil_slitting_plan_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class MiniCoilslittingplanProvider extends ChangeNotifier {
  MiniCoilSlittingPlanResponseModel? _miniCoilSlittingPlanResponse;
  MiniCoilSlittingPlanResponseModel? get miniresponse =>
      _miniCoilSlittingPlanResponse;

  final client = LoggingHttpClient();
  Future<MiniCoilSlittingPlanResponseModel?>
  gettingPlanListminicoilslitting() async {
    final response = await client.post(
      Uri.parse(ConstApi.miniCoilSlittingPlanapi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
      },
    );
    if (response.statusCode == 200) {
      _miniCoilSlittingPlanResponse =
          MiniCoilSlittingPlanResponseModel.fromJson(jsonDecode(response.body));
    } else {
      print("error in getting 200");
    }

    notifyListeners();
    return _miniCoilSlittingPlanResponse;
  }
}
