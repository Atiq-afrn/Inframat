import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/pausedata_send_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class PausedataSendProvider extends ChangeNotifier {
  TimelineUpdateResponseModel? _timelineUpdateResponseModel;
  TimelineUpdateResponseModel? get timelineresponsedata =>
      _timelineUpdateResponseModel;
  final client = LoggingHttpClient();
  Future<TimelineUpdateResponseModel?> gettingTimeLineResponse() async {
    final response = await client.post(
      Uri.parse(ConstApi.pausedataApi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
        "status": "",
        "time": "time",
        "reason_id": "id",
      },
    );

    if (response.statusCode == 200) {
      _timelineUpdateResponseModel = TimelineUpdateResponseModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      print(" Error : ${response.statusCode}");
    }
    notifyListeners();
    return _timelineUpdateResponseModel; 
  }
}
