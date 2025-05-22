import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/sub_category_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class SubCategoryProvider extends ChangeNotifier {
  SubCategoryModel? _subCategory;
  SubCategoryModel? get subCategory => _subCategory;

  List<dynamic> _dropdownList = [];
  List<dynamic> get dropdownlist => _dropdownList;

  final Client = LoggingHttpClient();
  Future<SubCategoryModel?> getSubCategory({required String id}) async {
    final response = await Client.post(
      Uri.parse("${ConstApi.subCatagoryApi}"),
      headers: {"Accept": "application/json"},
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
        "category_id": id,
      },
    );

    print(response.body);
    if (response.statusCode == 200) {
      _subCategory = SubCategoryModel.fromJson(jsonDecode(response.body));
      if (_subCategory != null) {
        _dropdownList.addAll(_subCategory!.data);
      } else {
        print("Error 404:${response.statusCode}");
      }
    } else {
      print("Error 405:${response.statusCode}");
    }

    notifyListeners();
    return _subCategory;
  }
}
