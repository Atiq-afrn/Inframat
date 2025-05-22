import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/coil_slitting_model.dart';
import 'package:inframat/shared_pref/shared_preferance.dart';

class CoilSlittingProvider extends ChangeNotifier {
  CoilSlittingModel? _coilSlittingModel;
  CoilSlittingModel? get coilSlitingdata => _coilSlittingModel;

  final client = LoggingHttpClient();

  // Base body with static data
  final Map<String, dynamic> apibody = {
    "data": [
      {
        "material_id": 123,
        "inward_id": 456,
        "length": 1500,
        "thickness": 2.5,
        "weight": 1000,
        "slit_at": "2025-04-28 10:00:00",
        "issued_at": "2025-04-28 12:00:00",
        "unit_id": 1,
        "plant_id": 2,
        "department_id": 3,
        "image": "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUA...",
      },
      {
        "material_id": 124,
        "inward_id": 457,
        "length": 1600,
        "thickness": 3.0,
        "weight": 1100,
        "slit_at": "2025-04-28 14:00:00",
        "issued_at": "2025-04-28 15:00:00",
        "unit_id": 1,
        "plant_id": 2,
        "department_id": 3,
        "image": "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAAAAAAAD...",
      },
    ],
  };

  Future<CoilSlittingModel?> gettingCoilSlitting() async {
    // Inject runtime values into apibody
    apibody["connection_id"] = await AppStorage.getConnectionId();
    apibody["auth_code"] =
        await AppStorage.gettingAuthId(); // change to 'auth_id' if needed

    final response = await client.post(
      Uri.parse(ConstApi.coilSlittingApi),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(apibody), // Proper JSON body
    );

    print('Response: ${response.body}');

    if (response.statusCode == 200) {
      _coilSlittingModel = CoilSlittingModel.fromJson(
        jsonDecode(response.body),
      );
      print("coil slitting data: ${_coilSlittingModel?.data}");
    } else {
      print("Request failed with status: ${response.statusCode}");
    }

    notifyListeners();
    return _coilSlittingModel;
  }
}
