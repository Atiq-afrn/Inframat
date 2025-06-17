import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/mini_coilSlittingResponse_model.dart';
import 'package:inframat/models/mini_coilSlitting_body_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class MiniCoilsllittingProcessProvider extends ChangeNotifier {
  MiniCoilSlittingProcessResponseModel? _miniCoilSlittingResponseModel;
  MiniCoilSlittingProcessResponseModel? get minicoilslittingresponseModel =>
      _miniCoilSlittingResponseModel;
  final client = LoggingHttpClient();
  final Map<String, dynamic> apibodyData = {};
  Future<MiniCoilSlittingProcessResponseModel?> gettingminiCoilSlitting(
    final List<CoilSlittingItem?> minislittingList,
    String scrapWeight,
    String batchNo,
  ) async {
    apibodyData["connection_id"] = await AppStorage.getConnectionId();
    apibodyData["auth_code"] = await AppStorage.gettingAuthId();
    apibodyData["scrap_weight"] = scrapWeight;
    apibodyData["batch_no"] = batchNo;
    apibodyData["data"] = minislittingList;

    final response = await client.post(
      Uri.parse(ConstApi.miniCoilslittingProcessApi),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(apibodyData),
    );
    if (response.statusCode == 201) {
      _miniCoilSlittingResponseModel =
          MiniCoilSlittingProcessResponseModel.fromJson(
            jsonDecode(response.body),
          );
    } else {
      print("Error : ${response.statusCode}");
    }
    notifyListeners();
    return _miniCoilSlittingResponseModel;
  }
}
