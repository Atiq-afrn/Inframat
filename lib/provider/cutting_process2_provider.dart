import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/cuttingprocess_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class CuttingProcess2Provider extends ChangeNotifier {
  CuttingProcessSaveResponseModel? _cuttingProcessmodel;
  CuttingProcessSaveResponseModel? get cuttingprocessdata =>
      _cuttingProcessmodel;
  final client = LoggingHttpClient();
  Future<CuttingProcessSaveResponseModel?> gettingCuttingProcees(
    String batchNo,
    String lengthreq,
    String widthreq,
    String piecesreq,
  ) async {
    final response = await client.post(
      Uri.parse(ConstApi.cuttingProcessProccessApi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
        "batch_no": batchNo,
        "inward_id": "33",
        //await AppStorage.gettinginwardId(),
        "machine_id": await AppStorage.gettingMachineId(),
        "length_required": lengthreq,
        "width_required": widthreq,
        "no_of_pieces": piecesreq,
      },
    );
    if (response.statusCode == 201) {
      _cuttingProcessmodel = CuttingProcessSaveResponseModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      print(" Error in provider : ${response.statusCode}");
    }
    notifyListeners();
    return _cuttingProcessmodel;
  }
}
