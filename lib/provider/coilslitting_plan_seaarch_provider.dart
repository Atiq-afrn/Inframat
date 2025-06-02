import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/coilslitting_search_plan.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class CoilslittingPlanSeaarchProvider extends ChangeNotifier {
  CoilSlittingPlanSearchResponseModel? _coilSlittingPlanSearchResponseModel;
  CoilSlittingPlanSearchResponseModel? get coilslittingPlansearch =>
      _coilSlittingPlanSearchResponseModel;
  final client = LoggingHttpClient();
  Future<CoilSlittingPlanSearchResponseModel?>
  gettingcoilSlittingPlanDataList() async {
    final response = await client.post(
      Uri.parse(ConstApi.coilslittingPlanSearchapi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
        "search": "3",
      },
    );

    print(response.body);

    if (response.statusCode == 200) {
      _coilSlittingPlanSearchResponseModel =
          CoilSlittingPlanSearchResponseModel.fromJson(
            jsonDecode(response.body),
          );
    } else {
      print("Error : ${response.statusCode}");
    }
    notifyListeners();
    return _coilSlittingPlanSearchResponseModel;
  }
}
