import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/vendors_list_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class VendorsListProvider extends ChangeNotifier {
  VendorListModel? _vendorListModel;
  VendorListModel? get vendorsListModel => _vendorListModel;
  final client = LoggingHttpClient();
  Future<VendorListModel?> gettingVendorsList() async {
    final response = await client.post(
      Uri.parse(ConstApi.vendorsListApi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
      },
    );
    print(response.body.toString());
    if (response.statusCode == 200) {
      _vendorListModel = VendorListModel.fromJson(jsonDecode(response.body));
      print("successfull 7777");
    } else {
      print("Error ${response.statusCode}");
    }
    notifyListeners();
    return _vendorListModel;
  }
}
