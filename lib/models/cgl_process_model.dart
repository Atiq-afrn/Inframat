class CglProcessResponseModel {
  final String? status;
  final String? message;
  final CglProcessData? data;

  CglProcessResponseModel({this.status, this.message, this.data});

  factory CglProcessResponseModel.fromJson(Map<String, dynamic> json) {
    return CglProcessResponseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] != null ? CglProcessData.fromJson(json['data']) : null,
    );
  }
}

class CglProcessData {
  final String? id;
  final String? inwardId;
  final String? batchNo;
  final String? thickness;
  final String? width;
  final String? length;
  final String? weight;
  final String? scrapWeight;
  final String? zincCoatingWeight;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  CglProcessData({
    this.id,
    this.inwardId,
    this.batchNo,
    this.thickness,
    this.width,
    this.length,
    this.weight,
    this.scrapWeight,
    this.zincCoatingWeight,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory CglProcessData.fromJson(Map<String, dynamic> json) {
    return CglProcessData(
      id: json['id']?.toString(),
      inwardId: json['inward_id']?.toString(),
      batchNo: json['batch_no'] as String?,
      thickness: json['thickness']?.toString(),
      width: json['width']?.toString(),
      length: json['length']?.toString(),
      weight: json['weight']?.toString(),
      scrapWeight: json['scrap_weight']?.toString(),
      zincCoatingWeight: json['zinc_coating_weight']?.toString(),
      image: json['image'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}
