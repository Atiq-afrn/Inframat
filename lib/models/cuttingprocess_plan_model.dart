class CuttingProcessPlanResponseModel {
  String? status;
  String? message;
  List<CuttingPlanData>? data;

  CuttingProcessPlanResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory CuttingProcessPlanResponseModel.fromJson(Map<String, dynamic> json) {
    return CuttingProcessPlanResponseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => CuttingPlanData.fromJson(item))
          .toList(),
    );
  }
}

class CuttingPlanData {
  String? id;
  String? planNo;
  String? inwardId;
  String? batchNo;
  String? length;
  String? width;
  String? thickness;
  String? machineId;
  String? expectedWeight;
  String? image;
  String? status;
  String? weight;
  String? scrap;
  String? createdAt;
  String? updatedAt;

  CuttingPlanData({
    this.id,
    this.planNo,
    this.inwardId,
    this.batchNo,
    this.length,
    this.width,
    this.thickness,
    this.machineId,
    this.expectedWeight,
    this.image,
    this.status,
    this.weight,
    this.scrap,
    this.createdAt,
    this.updatedAt,
  });

  factory CuttingPlanData.fromJson(Map<String, dynamic> json) {
    return CuttingPlanData(
      id: json['id']?.toString(),
      planNo: json['plan_no']?.toString(),
      inwardId: json['inward_id']?.toString(),
      batchNo: json['batch_no']?.toString(),
      length: json['length']?.toString(),
      width: json['width']?.toString(),
      thickness: json['thickness']?.toString(),
      machineId: json['machine_id']?.toString(),
      expectedWeight: json['expected_weight']?.toString(),
      image: json['image']?.toString(),
      status: json['status']?.toString(),
      weight: json['weight']?.toString(),
      scrap: json['scrap']?.toString(),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }
}
