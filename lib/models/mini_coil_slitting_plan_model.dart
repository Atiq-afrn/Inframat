class MiniCoilSlittingPlanResponseModel {
  final String? status;
  final String? message;
  final List<MiniCoilSlittingData>? data;

  MiniCoilSlittingPlanResponseModel({this.status, this.message, this.data});

  factory MiniCoilSlittingPlanResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return MiniCoilSlittingPlanResponseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data:
          (json['data'] as List<dynamic>?)
              ?.map(
                (e) => MiniCoilSlittingData.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );
  }
}

class MiniCoilSlittingData {
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
  final String? miniCoilSlittingStatus;
  final String? createdAt;
  final String? updatedAt;

  MiniCoilSlittingData({
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
    this.miniCoilSlittingStatus,
    this.createdAt,
    this.updatedAt,
  });

  factory MiniCoilSlittingData.fromJson(Map<String, dynamic> json) {
    return MiniCoilSlittingData(
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
      miniCoilSlittingStatus: json['mini_coil_slitting_status']?.toString(),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }
}
