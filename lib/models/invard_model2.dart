class InvardModel {
  String? vehicleNumber;
  String? vehiclePhotoBase64;
  String? vehicleInTime;
  String? transpotName;
  String? driverName;
  String? driverMobileNumber;
  String? catagory;
  String? subCatagory;
  String? gooodsPhotoBase64;
  String? itemName;
  String? itemQuantity;
  String? recievedQty;
  String? pices;
  String? ticketNo;
  String? loadedWeight;
  String? emptyWeight;
  String? netWeight;
  String? vendorsName;
  String? invoiceImageBase64;
  String? invoiceDate;
  String? itemDescription;
  String? docNo;
  String? poNo;
  String? remark;
  String? vendorsTicketNo;

  InvardModel({
    this.vehicleNumber,
    this.vehiclePhotoBase64,
    this.vehicleInTime,
    this.transpotName,
    this.driverName,
    this.driverMobileNumber,
    this.catagory,
    this.subCatagory,
    this.gooodsPhotoBase64,
    this.itemName,
    this.itemQuantity,
    this.recievedQty,
    this.pices,
    this.ticketNo,
    this.loadedWeight,
    this.emptyWeight,
    this.netWeight,
    this.vendorsName,
    this.invoiceImageBase64,
    this.invoiceDate,
    this.itemDescription,
    this.docNo,
    this.poNo,
    this.remark,
    this.vendorsTicketNo,
  });

  factory InvardModel.fromJson(Map<String, dynamic> json) {
    return InvardModel(
      vehicleNumber: json['vehicleNumber'],
      vehiclePhotoBase64: json['vehiclePhotoBase64'],
      vehicleInTime: json['vehicleInTime'],
      transpotName: json['Transporter_name'],
      driverName: json['driverName'],
      driverMobileNumber: json['driverMobileNumber'],
      catagory: json['catagory'],
      subCatagory: json['subCatagory'],
      gooodsPhotoBase64: json['gooodsPhotoBase64'],
      itemName: json['itemName'],
      itemQuantity: json['itemQuantity'],
      recievedQty: json['recievedQty'],
      pices: json['pices'],
      ticketNo: json['ticketNo'],
      loadedWeight: json['loadedWeight'],
      emptyWeight: json['emptyWeight'],
      netWeight: json['netWeight'],
      vendorsName: json['vendorsName'],
      invoiceImageBase64: json['invoiceImageBase64'],
      invoiceDate: json['invoiceDate'],
      itemDescription: json['itemDescription'],
      docNo: json['docNo'],
      poNo: json['poNo'],
      remark: json['remark'],
      vendorsTicketNo: json['vender_ticket_no'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vehicleNumber': vehicleNumber,
      'vehiclePhotoBase64': vehiclePhotoBase64,
      'vehicleInTime': vehicleInTime,
      'Transporter_name': transpotName,
      'driverName': driverName,
      'driverMobileNumber': driverMobileNumber,
      'catagory': catagory,
      'subCatagory': subCatagory,
      'gooodsPhotoBase64': gooodsPhotoBase64,
      'itemName': itemName,
      'itemQuantity': itemQuantity,
      'recievedQty': recievedQty,
      'pices': pices,
      'ticketNo': ticketNo,
      'loadedWeight': loadedWeight,
      'emptyWeight': emptyWeight,
      'netWeight': netWeight,
      'vendorsName': vendorsName,
      'invoiceImageBase64': invoiceImageBase64,
      'invoiceDate': invoiceDate,
      'itemDescription': itemDescription,
      'docNo': docNo,
      'poNo': poNo,
      'remark': remark,
      'vender_ticket_no': vendorsTicketNo,
    };
  }
}
