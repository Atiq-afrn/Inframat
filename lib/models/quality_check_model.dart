import 'dart:convert';

class QualityCheckModel {
  final String status;
  final String message;
  final QualityCheckData data;

  QualityCheckModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory QualityCheckModel.fromJson(Map<String, dynamic> json) {
    return QualityCheckModel(
      status: json['status'],
      message: json['message'],
      data: QualityCheckData.fromJson(json['data']),
    );
  }
}

class QualityCheckData {
  final int id;
  final String? materialId;
  final String coilWeight;
  final int plantId;
  final String image;
  final String issuedTo;
  final int status;
  final String createdAt;
  final String updatedAt;
  final int unitId;
  final int? categoryId;
  final int? subcategoryId;
  final String? itemName;
  final int? pieces;
  final String? ticketNo;
  final String? loadedWeight;
  final String? emptyWeight;
  final String? netWeight;
  final int? transportationId;
  final int noOfCoils;
  final List<String> qualityCheckImages;

  QualityCheckData({
    required this.id,
    required this.materialId,
    required this.coilWeight,
    required this.plantId,
    required this.image,
    required this.issuedTo,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.unitId,
    this.categoryId,
    this.subcategoryId,
    this.itemName,
    this.pieces,
    this.ticketNo,
    this.loadedWeight,
    this.emptyWeight,
    this.netWeight,
    this.transportationId,
    required this.noOfCoils,
    required this.qualityCheckImages,
  });
  factory QualityCheckData.fromJson(Map<String, dynamic> json) {
    final rawImages = json['quality_check_image'];

    return QualityCheckData(
      id: json['id'],
      materialId: json['material_id'] ?? "",
      coilWeight: json['coil_weight'] ?? "",
      plantId: json['plant_id'] ?? 0,
      image: json['image'] ?? "",
      issuedTo: json['issued_to'] ?? "",
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      unitId: json['unit_id'] ?? 0,
      categoryId: json['category_id'],
      subcategoryId: json['subcategory_id'],
      itemName: json['item_name'],
      pieces: json['pieces'],
      ticketNo: json['ticket_no'],
      loadedWeight: json['loaded_weight'],
      emptyWeight: json['empty_weight'],
      netWeight: json['net_weight'],
      transportationId: json['transportation_id'],
      noOfCoils: json['no_of_coils'],
      qualityCheckImages:
          rawImages != null ? List<String>.from(jsonDecode(rawImages)) : [],
    );
  }
}
