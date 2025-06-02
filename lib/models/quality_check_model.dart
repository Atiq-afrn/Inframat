class QualityCheckModel {
  final String status;
  final String message;
  final InwardData data;

  QualityCheckModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory QualityCheckModel.fromJson(Map<String, dynamic> json) {
    return QualityCheckModel(
      status: json['status'],
      message: json['message'],
      data: InwardData.fromJson(json['data']),
    );
  }
}

class InwardData {
  final int id;
  final String batchNo;
  final String name;
  final int? plantId;
  final int? siteId;
  final int? workstationId;
  final int inwardTypeId;
  final int categoryId;
  final int transportationId;
  final int vendorId;
  final String goodsImage;
  final int pieces;
  final String ticketNo;
  final int? numberOfCoils;
  final String loadedWeight;
  final String emptyWeight;
  final String netWeight;
  final String invoicePhoto;
  final String invoiceDate;
  final String? itemDescription;
  final String docNo;
  final String poNo;
  final String? remark;
  final String createdAt;
  final String updatedAt;

  InwardData({
    required this.id,
    required this.batchNo,
    required this.name,
    this.plantId,
    this.siteId,
    this.workstationId,
    required this.inwardTypeId,
    required this.categoryId,
    required this.transportationId,
    required this.vendorId,
    required this.goodsImage,
    required this.pieces,
    required this.ticketNo,
    this.numberOfCoils,
    required this.loadedWeight,
    required this.emptyWeight,
    required this.netWeight,
    required this.invoicePhoto,
    required this.invoiceDate,
    this.itemDescription,
    required this.docNo,
    required this.poNo,
    this.remark,
    required this.createdAt,
    required this.updatedAt,
  });

  factory InwardData.fromJson(Map<String, dynamic> json) {
    return InwardData(
      id: json['id'],
      batchNo: json['batch_no'],
      name: json['name'],
      plantId: json['plant_id'],
      siteId: json['site_id'],
      workstationId: json['workstation_id'],
      inwardTypeId: json['inward_type_id'],
      categoryId: json['category_id'],
      transportationId: json['transportation_id'],
      vendorId: json['vendor_id'],
      goodsImage: json['goods_image'],
      pieces: json['pieces'],
      ticketNo: json['ticket_no'],
      numberOfCoils: json['number_of_coils'],
      loadedWeight: json['loaded_weight'],
      emptyWeight: json['empty_weight'],
      netWeight: json['net_weight'],
      invoicePhoto: json['invoice_photo'],
      invoiceDate: json['invoice_date'],
      itemDescription: json['item_description'],
      docNo: json['doc_no'],
      poNo: json['po_no'],
      remark: json['remark'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
