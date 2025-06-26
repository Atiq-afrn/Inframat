import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/cgl_process_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class CglProcessProvider extends ChangeNotifier {
  CglProcessResponseModel? _cglProcessResponseModel;
  CglProcessResponseModel? get cglprocessdata => _cglProcessResponseModel;
  final client = LoggingHttpClient();
  Future<CglProcessResponseModel?> gettingCglProcess(
    String batchNo,
    String length,
    String width,
    String thickness,
    String weight,
    String scrapweight,
    String zinccoating,
    String supplierIdNo,
    String base64imag,
  ) async {
    final response = await client.post(
      Uri.parse(ConstApi.cglProcessApi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
        "inward_id": "1",
        "batch_no": batchNo,
        "machine_id": await AppStorage.gettingMachineId(),
        "thickness": "7.9",
        "width": width,
        "length": length,
        "weight": weight,
        "scrap_weight": scrapweight,
        "zinc_coating_weight": zinccoating,
        "image": "base64imag",
      },
    );
    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      _cglProcessResponseModel = CglProcessResponseModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      print("error to get 200 status code");
    }
    notifyListeners();
    return _cglProcessResponseModel;
  }
}
