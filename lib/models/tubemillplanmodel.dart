class TubeMillPlanResponseModel {
  String? status;
  String? message;
  List<TubeMillPlanData>? data;

  TubeMillPlanResponseModel({this.status, this.message, this.data});

  factory TubeMillPlanResponseModel.fromJson(Map<String, dynamic> json) {
    return TubeMillPlanResponseModel(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List?)
          ?.map((item) => TubeMillPlanData.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}

class TubeMillPlanData {
  String? id;
  String? inwardId;
  String? batchNo;
  String? length;
  String? width;
  String? thickness;
  String? machineId;
  String? expectedWeight;
  String? image;
  String? weight;
  String? createdAt;
  String? updatedAt;
  String? status;
  String? actualScrapWeight;

  TubeMillPlanData({
    this.id,
    this.inwardId,
    this.batchNo,
    this.length,
    this.width,
    this.thickness,
    this.machineId,
    this.expectedWeight,
    this.image,
    this.weight,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.actualScrapWeight,
  });

  factory TubeMillPlanData.fromJson(Map<String, dynamic> json) {
    return TubeMillPlanData(
      id: json['id']?.toString(),
      inwardId: json['inward_id']?.toString(),
      batchNo: json['batch_no'],
      length: json['length'],
      width: json['width'],
      thickness: json['thickness'],
      machineId: json['machine_id']?.toString(),
      expectedWeight: json['expected_weight'],
      image: json['image'],
      weight: json['weight'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      status: json['status']?.toString(),
      actualScrapWeight: json['actual_scrap_weight']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'inward_id': inwardId,
        'batch_no': batchNo,
        'length': length,
        'width': width,
        'thickness': thickness,
        'machine_id': machineId,
        'expected_weight': expectedWeight,
        'image': image,
        'weight': weight,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'status': status,
        'actual_scrap_weight': actualScrapWeight,
      };
}
