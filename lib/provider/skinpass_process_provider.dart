import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/skin_process_response_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class SkinpassProcessProvider extends ChangeNotifier {
  SkinProcessResponseModel? _skinpassmodel;
  SkinProcessResponseModel? get skinpassmodeldata => _skinpassmodel;
  final client = LoggingHttpClient();
  Future<SkinProcessResponseModel?> gettingskinprocess(
    String batchNo,
    String length,
    String thickness,
    String width,
    String weight,
    String actualWeight,
    String scrap,

    String image,
  ) async {
    final response = await client.post(
      Uri.parse(ConstApi.skinpassProcessApi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
        "batch_no": batchNo,
        "inward_id": "33",
        //await AppStorage.gettinginwardId(),
        "length": length,
        "thickness": thickness,
        "width": width,
        "weight": weight,
        "actual_weight": actualWeight,
        "scrap": scrap,
        "machine_id": await AppStorage.gettingMachineId(),
        "image": "image",
      },
    );

    if (response.statusCode == 201) {
      _skinpassmodel = SkinProcessResponseModel.fromJson(
        jsonDecode(response.body),
      );
    }
    notifyListeners();
    return _skinpassmodel;
  }
}
