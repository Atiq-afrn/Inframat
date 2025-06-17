class TubeMillPlanModel {
  final String status;
  final String message;
  final List<TubeMillPlanData> data;

  TubeMillPlanModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TubeMillPlanModel.fromJson(Map<String, dynamic> json) {
    return TubeMillPlanModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => TubeMillPlanData.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class TubeMillPlanData {
  final int id;
  final int inwardId;
  final String batchNo;
  final String length;
  final String width;
  final String thickness;
  final int machineId;
  final String expectedWeight;
  final String image;
  final String weight;
  final String createdAt;
  final String updatedAt;
  final int status;
  final String? actualScrapWeight;

  TubeMillPlanData({
    required this.id,
    required this.inwardId,
    required this.batchNo,
    required this.length,
    required this.width,
    required this.thickness,
    required this.machineId,
    required this.expectedWeight,
    required this.image,
    required this.weight,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    this.actualScrapWeight,
  });

  factory TubeMillPlanData.fromJson(Map<String, dynamic> json) {
    return TubeMillPlanData(
      id: json['id'] ?? 0,
      inwardId: json['inward_id'] ?? 0,
      batchNo: json['batch_no'] ?? '',
      length: json['length'] ?? '',
      width: json['width'] ?? '',
      thickness: json['thickness'] ?? '',
      machineId: json['machine_id'] ?? 0,
      expectedWeight: json['expected_weight'] ?? '',
      image: json['image'] ?? '',
      weight: json['weight'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      status: json['status'] ?? 0,
      actualScrapWeight: json['actual_scrap_weight'],
    );
  }
}
