import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/coil_slitting_body_model.dart';

import 'package:inframat/models/coil_slitting_response_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class CoilSlittingProvider extends ChangeNotifier {
  CoilSlittingResponseModel? _coilSlittingModel;
  CoilSlittingResponseModel? get coilSlitingdata => _coilSlittingModel;

  final client = LoggingHttpClient();

  // Base body with static data
  final Map<String, dynamic> apibody = {};

  Future<CoilSlittingResponseModel?> gettingCoilSlitting(
    List<CoilSlittingBodyModel> coilSlittingModellist,
    String scrapWeight,
  ) async {
    apibody["connection_id"] = await AppStorage.getConnectionId();
    apibody["auth_code"] = await AppStorage.gettingAuthId();
    apibody["scrap_weight"] = scrapWeight;

    apibody["data"] = coilSlittingModellist;

    final response = await client.post(
      Uri.parse(ConstApi.coilSlittingApi),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(apibody),
    );

    print('Response: ${response.body}');

    if (response.statusCode == 200) {
      _coilSlittingModel = CoilSlittingResponseModel.fromJson(
        jsonDecode(response.body),
      );
      print("coil slitting data: ${_coilSlittingModel?.toJson()}");
    } else {
      print("Request failed with status: ${response.statusCode}");
    }

    notifyListeners();
    return _coilSlittingModel;
  }
}
