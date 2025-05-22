import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/get_connection_model.dart';
import 'package:http/http.dart' as http;

class ConnectionProvider extends ChangeNotifier {
  GetConnection? _getConnection;
  GetConnection? get getconnection => _getConnection;
  final client = LoggingHttpClient();
  Future<GetConnection?> getconnectionId() async {
    final response = await client.post(
      Uri.parse(ConstApi.getconnectionApi),
      body: {"api_key": "inframatDBSispl2023version2"},
    );
    print(response.body);
    if (response.statusCode == 200) {
      _getConnection = GetConnection.fromJson(jsonDecode(response.body));
    } else {
      print("network error");
    }
    notifyListeners();
    return _getConnection;
  }
}
