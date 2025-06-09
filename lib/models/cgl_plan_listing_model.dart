class CglPlanListingResponseModel {
  final String? status;
  final String? message;
  final List<ColdRollMillingPlan>? data;

  CglPlanListingResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory CglPlanListingResponseModel.fromJson(Map<String, dynamic> json) {
    return CglPlanListingResponseModel(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ColdRollMillingPlan.fromJson(e))
          .toList(),
    );
  }
}

class ColdRollMillingPlan {
  final int? id;
  final int? inwardId;
  final int? machineId;
  final String? batchNo;
  final String? thickness;
  final String? width;
  final String? length;
  final String? weight;
  final String? scrapWeight;
  final int? cglStatus;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  ColdRollMillingPlan({
    this.id,
    this.inwardId,
    this.machineId,
    this.batchNo,
    this.thickness,
    this.width,
    this.length,
    this.weight,
    this.scrapWeight,
    this.cglStatus,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory ColdRollMillingPlan.fromJson(Map<String, dynamic> json) {
    return ColdRollMillingPlan(
      id: json['id'],
      inwardId: json['inward_id'],
      machineId: json['machine_id'],
      batchNo: json['batch_no'],
      thickness: json['thickness'],
      width: json['width'],
      length: json['length'],
      weight: json['weight'],
      scrapWeight: json['scrap_weight'],
      cglStatus: json['cgl_status'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
