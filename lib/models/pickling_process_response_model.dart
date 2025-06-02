// pickled_oil_model.dart

class PicklingProcessResponseModel {
  final String status;
  final String message;
  final PickledOilData data;

  PicklingProcessResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PicklingProcessResponseModel.fromJson(Map<String, dynamic> json) {
    return PicklingProcessResponseModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: PickledOilData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class PickledOilData {
  final int id;
  final int inwardId;
  final String batchNo;
  final double actualWeight;
  final double picklingLoss;
  final int width;
  final int length;
  final int thickness;
  final String image;
  final String createdAt;
  final String updatedAt;

  PickledOilData({
    required this.id,
    required this.inwardId,
    required this.batchNo,
    required this.actualWeight,
    required this.picklingLoss,
    required this.width,
    required this.length,
    required this.thickness,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PickledOilData.fromJson(Map<String, dynamic> json) {
    return PickledOilData(
      id: json['id'],
      inwardId: json['inward_id'],
      batchNo: json['batch_no'],
      actualWeight: (json['actual_weight'] as num).toDouble(),
      picklingLoss: (json['pickling_loss'] as num).toDouble(),
      width: json['width'],
      length: json['length'],
      thickness: json['thickness'],
      image: json['image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'inward_id': inwardId,
      'batch_no': batchNo,
      'actual_weight': actualWeight,
      'pickling_loss': picklingLoss,
      'width': width,
      'length': length,
      'thickness': thickness,
      'image': image,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
