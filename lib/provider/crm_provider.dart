import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/crm_plan_listing_responsemodel.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class CrmProvider extends ChangeNotifier {
  ColdRollMillingResponseModel? _coldRollMillingResponseModel;
  ColdRollMillingResponseModel? get crmmodel => _coldRollMillingResponseModel;
  final client = LoggingHttpClient();
  Future<ColdRollMillingResponseModel?> gettingPlanListcrm() async {
    final response = await client.post(
      Uri.parse(ConstApi.crmplanListingApi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      _coldRollMillingResponseModel = ColdRollMillingResponseModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      print("Error : ${response.statusCode}");
    }

    notifyListeners();
    return _coldRollMillingResponseModel;
  }
}
