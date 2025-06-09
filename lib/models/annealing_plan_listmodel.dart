class AnnealingPlanResponseModel {
  final String? status;
  final String? message;
  final List<AnnealingPlanData>? data;

  AnnealingPlanResponseModel({this.status, this.message, this.data});

  factory AnnealingPlanResponseModel.fromJson(Map<String, dynamic> json) {
    return AnnealingPlanResponseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data:
          json['data'] != null
              ? List<AnnealingPlanData>.from(
                json['data'].map((item) => AnnealingPlanData.fromJson(item)),
              )
              : null,
    );
  }
}

class AnnealingPlanData {
  final String? id;
  final String? inwardId;
  final String? machineId;
  final String? batchNo;
  final String? thickness;
  final String? width;
  final String? length;
  final String? weight;
  final String? scrapWeight;
  final String? zincCoatingWeight;
  final String? annealingStatus;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  AnnealingPlanData({
    this.id,
    this.inwardId,
    this.machineId,
    this.batchNo,
    this.thickness,
    this.width,
    this.length,
    this.weight,
    this.scrapWeight,
    this.zincCoatingWeight,
    this.annealingStatus,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory AnnealingPlanData.fromJson(Map<String, dynamic> json) {
    return AnnealingPlanData(
      id: json['id']?.toString(),
      inwardId: json['inward_id']?.toString(),
      machineId: json['machine_id']?.toString(),
      batchNo: json['batch_no'] as String?,
      thickness: json['thickness'] as String?,
      width: json['width'] as String?,
      length: json['length'] as String?,
      weight: json['weight'] as String?,
      scrapWeight: json['scrap_weight'] as String?,
      zincCoatingWeight: json['zinc_coating_weight'] as String?,
      annealingStatus: json['annealing_status']?.toString(),
      image: json['image'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}
