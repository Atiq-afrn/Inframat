import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/pickling_plane_listing_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class PicklingPlanProvider extends ChangeNotifier {
  PicklingPlanlistModel? _picklingPlanlistModel;
  PicklingPlanlistModel? get picklingplanlist => _picklingPlanlistModel;

  final client = LoggingHttpClient();

  Future<PicklingPlanlistModel?> gettingPicklingPlanList() async {
    final response = await client.post(
      Uri.parse(ConstApi.piklingPlanlistApi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
        "search": "",
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      _picklingPlanlistModel = PicklingPlanlistModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      print("Error: ${response.statusCode}");
    }
    return _picklingPlanlistModel;
  }
}
