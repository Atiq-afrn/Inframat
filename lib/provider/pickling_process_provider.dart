import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/pickling_process_body_model.dart';
import 'package:inframat/models/pickling_process_response_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class PicklingProcessProvider extends ChangeNotifier {
  PicklingProcessResponseModel? _picklingProcessModel;
  PicklingProcessResponseModel? get picklingprocess => _picklingProcessModel;
  final client = LoggingHttpClient();
  Future<PicklingProcessResponseModel?> gettingPicklingProcess(
    String batchNo,
    String actualWeight,
    String picklingLoss,
    String length,
    String width,
    String base64Image,
  ) async {
    final response = await client.post(
      Uri.parse(ConstApi.picklingProcessApi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
        "inward_id": "33",
        //await AppStorage.gettinginwardId(),
        "machine_id": await AppStorage.gettingMachineId(),
        "width": width,
        "length": length,
        "thickness": "434",
        "batch_no": batchNo,
        "actual_weight": actualWeight,
        "pickling_loss": picklingLoss,
        "image": "base64Image",
      },
    );
    print(batchNo);

    print(response.body);

    if (response.statusCode == 201) {
      _picklingProcessModel = PicklingProcessResponseModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      print("Error :${response.statusCode}");
    }
    notifyListeners();
    return _picklingProcessModel;
  }
}
