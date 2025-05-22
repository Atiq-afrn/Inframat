import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/catagory_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class CatagoryProvider extends ChangeNotifier {
  CatagoryModel? _catagory;
  CatagoryModel? get catagory => _catagory;
  List<dynamic> _dropdownList = [];
  List<dynamic> get dropdownlist => _dropdownList;

  final client = LoggingHttpClient();
  Future<CatagoryModel?> getCatagory() async {
    final response = await client.post(
      Uri.parse("${ConstApi.catagoryApi}"),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
      },
    );

    print(response.body);
    if (response.statusCode == 200) {
      _dropdownList.clear();
      _catagory = CatagoryModel.fromJson(jsonDecode(response.body));
      if (_catagory != null) {
        _dropdownList.addAll(_catagory!.data);
      } else {
        print("Error000:${response.statusCode}");
      }
      notifyListeners();
    }
    return _catagory;
  }
}
