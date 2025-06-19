import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/tube_mill_planmodel.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class TubemillPrvider1 extends ChangeNotifier {
  TubeMillPlanModel? _tubeMillPlan;

  TubeMillPlanModel? get tubeMillPlan => _tubeMillPlan;
  final client = LoggingHttpClient();
  Future<TubeMillPlanModel?> fetchTubeMillplan() async {
    final response = await client.post(
      Uri.parse(ConstApi.tubeMillPlanListApi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
        "search": "",
      },
    );
    if (response.statusCode == 200) {
      _tubeMillPlan = TubeMillPlanModel.fromJson(jsonDecode(response.body));
    } else {
      print("Error: ${response.statusCode}");
    }
    notifyListeners();
    return _tubeMillPlan;
  }
}
