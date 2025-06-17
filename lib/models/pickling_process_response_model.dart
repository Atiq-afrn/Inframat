class PicklingProcessResponseModel {
  final String? status;
  final String? message;
  final PickledOilStoreData? data;

  PicklingProcessResponseModel({this.status, this.message, this.data});

  factory PicklingProcessResponseModel.fromJson(Map<String, dynamic> json) {
    return PicklingProcessResponseModel(
      status: json['status']?.toString(),
      message: json['message']?.toString(),
      data:
          json['data'] != null
              ? PickledOilStoreData.fromJson(json['data'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'message': message, 'data': data?.toJson()};
  }
}

class PickledOilStoreData {
  final String? inwardId;
  final String? batchNo;
  final String? actualWeight;
  final String? picklingLoss;
  final String? width;
  final String? length;
  final String? thickness;
  final String? image;
  final String? updatedAt;
  final String? createdAt;
  final String? id;

  PickledOilStoreData({
    this.inwardId,
    this.batchNo,
    this.actualWeight,
    this.picklingLoss,
    this.width,
    this.length,
    this.thickness,
    this.image,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory PickledOilStoreData.fromJson(Map<String, dynamic> json) {
    return PickledOilStoreData(
      inwardId: json['inward_id']?.toString(),
      batchNo: json['batch_no']?.toString(),
      actualWeight: json['actual_weight']?.toString(),
      picklingLoss: json['pickling_loss']?.toString(),
      width: json['width']?.toString(),
      length: json['length']?.toString(),
      thickness: json['thickness']?.toString(),
      image: json['image']?.toString(),
      updatedAt: json['updated_at']?.toString(),
      createdAt: json['created_at']?.toString(),
      id: json['id']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'inward_id': inwardId,
      'batch_no': batchNo,
      'actual_weight': actualWeight,
      'pickling_loss': picklingLoss,
      'width': width,
      'length': length,
      'thickness': thickness,
      'image': image,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}
