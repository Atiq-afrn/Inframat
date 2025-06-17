class SkinProcessResponseModel {
  final String? status;
  final String? message;
  final SkinProcessData? data;

  SkinProcessResponseModel({this.status, this.message, this.data});

  factory SkinProcessResponseModel.fromJson(Map<String, dynamic> json) {
    return SkinProcessResponseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data:
          json['data'] != null ? SkinProcessData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message, 'data': data?.toJson()};
  }
}

class SkinProcessData {
  final String? id;
  final String? batchNo;
  final String? inwardId;
  final String? length;
  final String? thickness;
  final String? width;
  final String? weight;
  final String? actualWeight;
  final String? scrap;
  final String? machineId;
  final String? image;
  final String? updatedAt;
  final String? createdAt;

  SkinProcessData({
    this.id,
    this.batchNo,
    this.inwardId,
    this.length,
    this.thickness,
    this.width,
    this.weight,
    this.actualWeight,
    this.scrap,
    this.machineId,
    this.image,
    this.updatedAt,
    this.createdAt,
  });

  factory SkinProcessData.fromJson(Map<String, dynamic> json) {
    return SkinProcessData(
      id: json['id']?.toString(),
      batchNo: json['batch_no']?.toString(),
      inwardId: json['inward_id']?.toString(),
      length: json['length']?.toString(),
      thickness: json['thickness']?.toString(),
      width: json['width']?.toString(),
      weight: json['weight']?.toString(),
      actualWeight: json['actual_weight']?.toString(),
      scrap: json['scrap']?.toString(),
      machineId: json['machine_id']?.toString(),
      image: json['image']?.toString(),
      updatedAt: json['updated_at']?.toString(),
      createdAt: json['created_at']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'batch_no': batchNo,
      'inward_id': inwardId,
      'length': length,
      'thickness': thickness,
      'width': width,
      'weight': weight,
      'actual_weight': actualWeight,
      'scrap': scrap,
      'machine_id': machineId,
      'image': image,
      'updated_at': updatedAt,
      'created_at': createdAt,
    };
  }
}
