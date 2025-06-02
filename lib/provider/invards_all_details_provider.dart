import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inframat/const/const_api.dart';
import 'package:inframat/logger.dart';
import 'package:inframat/models/invard_model2.dart';
import 'package:inframat/models/invards_model.dart';

import 'package:inframat/shared_pref/shared_preferance.dart';

class InvardsAllDetailsProvider extends ChangeNotifier {
  InvardModel1? _invardModel1;
  InvardModel1? get invardmodel => _invardModel1;
  final client = LoggingHttpClient();

  Future<InvardModel1?> getInertInvardsDetails(InvardModel models) async {
    final response = await client.post(
      Uri.parse("${ConstApi.invardDetailsApi}"),
      body: {
        "connection_id": await AppStorage.getConnectionId(),
        "auth_code": await AppStorage.gettingAuthId(),
        "vehicle_number": models.vehicleNumber,
        "plant_id": await AppStorage.gettingPlantId(),
        "site_id": await AppStorage.gettingSiteId(),
        "vehicle_image": "models.vehiclePhotoBase64",
        "vehicle_in_time": "2025-05-16 18:33:55",
        //,"2025-05-16 18:33:55"
        "transporter_name": models.transpotName,
        "driver_name": models.driverName,
        "driver_mobile_no": models.driverMobileNumber.toString(),
        "inward_type_id": models.catagory.toString(),
        // models.catagory,
        "category_id": models.subCatagory.toString(),
        //models.subCatagory,
        "goods_image": "models.gooodsPhotoBase64",
        "name": models.itemName,
        "pieces": models.pices,
        "ticket_no": models.ticketNo.toString(),
        "loaded_weight": models.loadedWeight.toString(),
        "empty_weight": models.emptyWeight,
        "net_weight": models.netWeight,
        "vendor": models.vendorsName,
        "invoice_photo": "models.invoiceImageBase64",
        "invoice_date": models.invoiceDate,
        "item_description": models.itemDescription,
        "doc_no": models.docNo,
        "po_no": models.poNo,
        // "vendor_remark": models.remark,
        // "vendor_ticket_no": models.vendorsTicketNo,
        // "transportation_id": "23",
      },
    );

    print(response.body.toString());

    if (response.statusCode == 200) {
      _invardModel1 = InvardModel1.fromJson(jsonDecode(response.body));
      print("successfull 777");
    } else {
      print("error 7777");
    }
    notifyListeners();
    return _invardModel1;
  }
}
