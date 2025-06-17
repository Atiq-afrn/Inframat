class PicklingPlanlistModel {
  final String? status;
  final String? message;
  final List<PicklingPlan>? data;

  PicklingPlanlistModel({
    this.status,
    this.message,
    this.data,
  });

  factory PicklingPlanlistModel.fromJson(Map<String, dynamic> json) {
    return PicklingPlanlistModel(
      status: json['status']?.toString(),
      message: json['message']?.toString(),
      data: json['data'] != null
          ? List<PicklingPlan>.from(json['data'].map((item) => PicklingPlan.fromJson(item)))
          : null,
    );
  }
}

class PicklingPlan {
  final String? id;
  final String? inwardId;
  final String? batchNo;
  final String? length;
  final String? width;
  final String? thickness;
  final String? image;
  final String? weight;
  final String? machineId;
  final String? statusPickling;
  final String? createdAt;
  final String? updatedAt;
  final String? scrap;

  PicklingPlan({
    this.id,
    this.inwardId,
    this.batchNo,
    this.length,
    this.width,
    this.thickness,
    this.image,
    this.weight,
    this.machineId,
    this.statusPickling,
    this.createdAt,
    this.updatedAt,
    this.scrap,
  });

  factory PicklingPlan.fromJson(Map<String, dynamic> json) {
    return PicklingPlan(
      id: json['id']?.toString(),
      inwardId: json['inward_id']?.toString(),
      batchNo: json['batch_no']?.toString(),
      length: json['length']?.toString(),
      width: json['width']?.toString(),
      thickness: json['thickness']?.toString(),
      image: json['image']?.toString(),
      weight: json['weight']?.toString(),
      machineId: json['machine_id']?.toString(),
      statusPickling: json['status_pickling']?.toString(),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
      scrap: json['scrap']?.toString(),
    );
  }
}
