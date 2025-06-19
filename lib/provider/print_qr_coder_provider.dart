import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/print_qrcode.dart';
import 'package:inframat/models/qr_code_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class PrintQrCoderProvider extends ChangeNotifier {
  QrResponseModel? _qrResponseModel;
  QrResponseModel? get qrcoderdata => _qrResponseModel;
  final client = LoggingHttpClient();
  Future<QrResponseModel?> gettingqrCodeData(String batchNo) async {
    final response = await client.post(
      Uri.parse(ConstApi.printQrcodeApi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
        "data": batchNo,
      },
    );
    if (response.statusCode == 200) {
      _qrResponseModel = QrResponseModel.fromJson(jsonDecode(response.body));
    } else {
      print("error: ${response.statusCode}");
    }

    notifyListeners();
    return _qrResponseModel;
  }
}
