class MiniCoilSlittingProcessResponseModel {
  final String? status;
  final String? message;
  final List<CoilSlittingData>? data;

  MiniCoilSlittingProcessResponseModel({this.status, this.message, this.data});

  factory MiniCoilSlittingProcessResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return MiniCoilSlittingProcessResponseModel(
      status: json['status'],
      message: json['message'],
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => CoilSlittingData.fromJson(e))
              .toList(),
    );
  }
}

class CoilSlittingData {
  final String? batchNo;
  final String? inwardId;
  final String? length;
  final String? width;
  final String? thickness;
  final String? expectedWeight;
  final String? weight;
  final String? machineId;
  final String? image;
  final String? updatedAt;
  final String? createdAt;
  final String? id;

  CoilSlittingData({
    this.batchNo,
    this.inwardId,
    this.length,
    this.width,
    this.thickness,
    this.expectedWeight,
    this.weight,
    this.machineId,
    this.image,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory CoilSlittingData.fromJson(Map<String, dynamic> json) {
    return CoilSlittingData(
      batchNo: json['batch_no']?.toString(),
      inwardId: json['inward_id']?.toString(),
      length: json['length']?.toString(),
      width: json['width']?.toString(),
      thickness: json['thickness']?.toString(),
      expectedWeight: json['expected_weight']?.toString(),
      weight: json['weight']?.toString(),
      machineId: json['machine_id']?.toString(),
      image: json['image'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id']?.toString(),
    );
  }
}
