import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/qr_code_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class QrScannProvider extends ChangeNotifier {
  QrCodeModel? _qrCodeModel;
  QrCodeModel? get qrCodeModel => _qrCodeModel;
  final client = LoggingHttpClient();
  Future<QrCodeModel?> getQrcodeData(String qrdata) async {
    final response = await client.post(
      Uri.parse(ConstApi.qrCodeapi),

      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
        "qrCode": qrdata,
      },
    );

    print(response.body);
    if (response.statusCode == 200) {
      _qrCodeModel = QrCodeModel.fromJson(jsonDecode(response.body));
    } else {
      print("error 000");
    }

    ChangeNotifier();
    return _qrCodeModel;
  }
}
