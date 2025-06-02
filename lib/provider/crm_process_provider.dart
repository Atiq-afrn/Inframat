import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/crm_processing_response_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class CrmProcessProvider extends ChangeNotifier {
  ColdRollingMillBodyResponse? _bodyResponse;
  ColdRollingMillBodyResponse? get bodyresponse => _bodyResponse;

  final client = LoggingHttpClient();
  Future<ColdRollingMillBodyResponse?> gettingCrmProcess(
    String lenght,
    String width,
    String mtweight,
    String scrapWeight,
    String actualWeight,
    String base64image,
    String batchNo,
    // String thickness,
  ) async {
    final response = await client.post(
      Uri.parse(ConstApi.crmProcessingApi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),

        "inward_id": "2",
        "machine_id": await AppStorage.gettingMachineId(),
        "batch_no": batchNo,
        "thickness": " 0.5",
        "width": width,
        "length": lenght,
        "weight": actualWeight,
        "scrap_weight": scrapWeight,
        "image": base64image,
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      _bodyResponse = ColdRollingMillBodyResponse.fromJson(
        jsonDecode(response.body),
      );
    } else {
      print("something went wromg");
    }
    notifyListeners();
    return _bodyResponse;
  }
}
