import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/quality_check_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class QualityCheckProvider extends ChangeNotifier {
  QualityCheckModel? _checkModel;
  QualityCheckModel? get qualityCheckData => _checkModel;
  final client = LoggingHttpClient();
  Future<QualityCheckModel?> gettingQualityCheck(
    List<String> imagesBase64,
  ) async {
    final response = await client.post(
      Uri.parse(ConstApi.qualitycheckApi),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
        "inward_id": await AppStorage.gettinginwardId(),
        "no_of_coils": imagesBase64.length,
        "quality_check_image": imagesBase64,
      }),
    );

    print(response.body);
    if (response.statusCode == 200) {
      _checkModel = QualityCheckModel.fromJson(jsonDecode(response.body));
      print("success");
    } else {
      print("error");
    }

    notifyListeners();
    return _checkModel;
  }
}
