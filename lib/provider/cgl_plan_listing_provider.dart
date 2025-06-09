import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/cgl_plan_listing_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class CglPlanListingProvider extends ChangeNotifier {
  CglPlanListingResponseModel? _cglPlanListingResponseModel;
  CglPlanListingResponseModel? get cglplanListingModel =>
      _cglPlanListingResponseModel;
  final client = LoggingHttpClient();
  Future<CglPlanListingResponseModel?> gettingcglPlanList() async {
    final response = await post(
      Uri.parse(ConstApi.cglPlanListingApi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      _cglPlanListingResponseModel = CglPlanListingResponseModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      print(" error to fetch  api data ");
    }
    notifyListeners();
    return _cglPlanListingResponseModel;
  }
}
