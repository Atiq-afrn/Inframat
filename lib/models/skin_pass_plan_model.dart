class SkinPassPlanResponse {
  final String? status;
  final String? message;
  final List<SkinPassPlanData>? data;

  SkinPassPlanResponse({
    this.status,
    this.message,
    this.data,
  });

  factory SkinPassPlanResponse.fromJson(Map<String, dynamic> json) {
    return SkinPassPlanResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SkinPassPlanData.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class SkinPassPlanData {
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
  final String? skinPassStatus;
  final String? createdAt;
  final String? updatedAt;

  SkinPassPlanData({
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
    this.skinPassStatus,
    this.createdAt,
    this.updatedAt,
  });

  factory SkinPassPlanData.fromJson(Map<String, dynamic> json) {
    return SkinPassPlanData(
      id: json['id']?.toString(),
      batchNo: json['batch_no'],
      inwardId: json['inward_id']?.toString(),
      length: json['length']?.toString(),
      thickness: json['thickness']?.toString(),
      width: json['width']?.toString(),
      weight: json['weight']?.toString(),
      actualWeight: json['actual_weight']?.toString(),
      scrap: json['scrap']?.toString(),
      machineId: json['machine_id']?.toString(),
      image: json['image'],
      skinPassStatus: json['skin_pass_status']?.toString(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
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
      'skin_pass_status': skinPassStatus,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
