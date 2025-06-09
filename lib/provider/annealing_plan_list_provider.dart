import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/annealing_plan_listmodel.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class AnnealingPlanListProvider extends ChangeNotifier {
  AnnealingPlanResponseModel? _annealingPlanResponseModel;
  AnnealingPlanResponseModel? get annealingplandata =>
      _annealingPlanResponseModel;
  final client = LoggingHttpClient();
  Future<AnnealingPlanResponseModel?> gettingAnnealingPlanList() async {
    final response = await client.post(
      Uri.parse(ConstApi.annealingPlanListApi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      _annealingPlanResponseModel = AnnealingPlanResponseModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      print("some thing error in api call ");
    }
    notifyListeners();
    return _annealingPlanResponseModel;
  }
}
