// cold_roll_milling_model.dart

class ColdRollMillingResponseModel {
  final String status;
  final String message;
  final List<ColdRollMillingData> data;

  ColdRollMillingResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ColdRollMillingResponseModel.fromJson(Map<String, dynamic> json) {
    return ColdRollMillingResponseModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>)
          .map((e) => ColdRollMillingData.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data.map((e) => e.toJson()).toList(),
      };
}

class ColdRollMillingData {
  final int id;
  final String length;
  final String width;
  final String thickness;
  final int inwardId;
  final int machineId;
  final int statusCrm;
  final String batchNo;
  final String actualWeight;
  final String picklingLoss;
  final String image;
  final String createdAt;
  final String updatedAt;

  ColdRollMillingData({
    required this.id,
    required this.length,
    required this.width,
    required this.thickness,
    required this.inwardId,
    required this.machineId,
    required this.statusCrm,
    required this.batchNo,
    required this.actualWeight,
    required this.picklingLoss,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ColdRollMillingData.fromJson(Map<String, dynamic> json) {
    return ColdRollMillingData(
      id: json['id'],
      length: json['length'] ?? '',
      width: json['width'] ?? '',
      thickness: json['thickness'] ?? '',
      inwardId: json['inward_id'],
      machineId: json['machine_id'],
      statusCrm: json['status_crm'],
      batchNo: json['batch_no'] ?? '',
      actualWeight: json['actual_weight'] ?? '',
      picklingLoss: json['pickling_loss'] ?? '',
      image: json['image'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'length': length,
        'width': width,
        'thickness': thickness,
        'inward_id': inwardId,
        'machine_id': machineId,
        'status_crm': statusCrm,
        'batch_no': batchNo,
        'actual_weight': actualWeight,
        'pickling_loss': picklingLoss,
        'image': image,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
