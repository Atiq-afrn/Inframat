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
        "vehicle_noo": models.vehicleNumber,
        "vehicle_image": "models.vehiclePhotoBase64",
        "vehicle_in_time": "2025-05-16 18:33:55",
        //,"2025-05-16 18:33:55"
        "transporter_name": models.transpotName,
        "driver_name": models.driverName,
        "driver_dobile_no": models.driverMobileNumber.toString(),
        "category_id": models.catagory.toString(),
        // models.catagory,
        "subcategory_id": models.subCatagory.toString(),
        //models.subCatagory,
        "goods_image": "models.gooodsPhotoBase64",
        "item_name": models.itemName,
        "pieces": models.pices,
        "ticket_no": models.ticketNo.toString(),
        "loaded_weight": models.loadedWeight.toString(),
        "empty_weight": models.emptyWeight,
        "net_weight": models.netWeight,
        "vender_name": models.vendorsName,
        "invoice_photo": "models.invoiceImageBase64",
        "invoice_date": models.invoiceDate,
        "item_description": models.itemDescription,
        "doc_no": models.docNo,
        "po_no": models.poNo,
        "vender_remark": models.remark,
        "vender_ticket_no": models.vendorsTicketNo,
        "transportation_id": "23",
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
