import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/pausereasonlist_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class PauslistProvider extends ChangeNotifier {
  IssueResponselistModel? _issueResponselistModel;
  IssueResponselistModel? get issueResponselist => _issueResponselistModel;

  final client = LoggingHttpClient();
  Future<IssueResponselistModel?> gettingPauseList() async {
    final response = await client.post(
      Uri.parse(ConstApi.pauseListapi),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
      },
    );
    if (response.statusCode == 200) {
      _issueResponselistModel = IssueResponselistModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      print(" Error in getting 200: ${response.statusCode}");
    }

    notifyListeners();
    return _issueResponselistModel;
  }
}
