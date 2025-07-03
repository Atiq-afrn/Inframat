import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/timelog_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class TimellogProvider extends ChangeNotifier {
  TimelogResponseModel? _timelogResponseModel;
  TimelogResponseModel? get timelogdata => _timelogResponseModel;
  final client = LoggingHttpClient();

  Future<TimelogResponseModel?> gettingTimeLog(
    String typeValue,
    String? resonid,
  ) async {
    // ✅ Construct body based on typeValue
    final Map<String, dynamic> body = {
      "machine_id": await AppStorage.gettingMachineId(),
      "user_id": await AppStorage.gettingOperatorID(),
      "actions": [
        if (typeValue == "pause")
          {"type": "pause", "reason_id": "${resonid}"}
        else
          {"type": typeValue},
      ],
    };

    try {
      final response = await client.post(
        Uri.parse(ConstApi.timeLogApi),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        _timelogResponseModel = TimelogResponseModel.fromJson(
          jsonDecode(response.body),
        );
      } else {
        print("❌ Error: ${response.statusCode}");
        print("❌ Response body: ${response.body}");
      }
    } catch (e) {
      print("❗ Exception: $e");
    }

    notifyListeners();
    return _timelogResponseModel;
  }
}
