

class PicklingPlanlistModel {
  final String status;
  final String message;
  final List<PicklingData> data;

  PicklingPlanlistModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PicklingPlanlistModel.fromJson(Map<String, dynamic> json) {
    return PicklingPlanlistModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: (json['data'] as List)
          .map((item) => PicklingData.fromJson(item))
          .toList(),
    );
  }
}

class PicklingData {
  final int id;
  final int? machineId;
  final int statusPickling;
  final int inwardId;
  final String batchNo;
  final int length;
  final int width;
  final int thickness;
  final String image;
  final String weight;
  final String createdAt;
  final String updatedAt;
  final String? expectedWeight;

  PicklingData({
    required this.id,
    this.machineId,
    required this.statusPickling,
    required this.inwardId,
    required this.batchNo,
    required this.length,
    required this.width,
    required this.thickness,
    required this.image,
    required this.weight,
    required this.createdAt,
    required this.updatedAt,
    this.expectedWeight,
  });

  factory PicklingData.fromJson(Map<String, dynamic> json) {
    return PicklingData(
      id: json['id'],
      machineId: json['machine_id'],
      statusPickling: json['status_pickling'],
      inwardId: json['inward_id'],
      batchNo: json['batch_no'],
      length: json['length'],
      width: json['width'],
      thickness: json['thickness'],
      image: json['image'],
      weight: json['weight'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      expectedWeight: json['expected_weight'],
    );
  }
}
