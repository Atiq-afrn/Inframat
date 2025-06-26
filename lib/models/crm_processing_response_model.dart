class ColdRollingMillBodyResponse {
  String? message;
  ColdRollingMillData? data;

  ColdRollingMillBodyResponse({this.message, this.data});

  factory ColdRollingMillBodyResponse.fromJson(Map<String, dynamic> json) {
    return ColdRollingMillBodyResponse(
      message: json['message']?.toString(),
      data:
          json['data'] != null
              ? ColdRollingMillData.fromJson(json['data'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'data': data?.toJson()};
  }
}

class ColdRollingMillData {
  String? inwardId;
  String? batchNo;
  String? thickness;
  String? width;
  String? length;
  String? weight;
  String? scrapWeight;
  String? image;
  String? updatedAt;
  String? createdAt;
  String? id;

  ColdRollingMillData({
    this.inwardId,
    this.batchNo,
    this.thickness,
    this.width,
    this.length,
    this.weight,
    this.scrapWeight,
    this.image,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory ColdRollingMillData.fromJson(Map<String, dynamic> json) {
    return ColdRollingMillData(
      inwardId: json['inward_id']?.toString(),
      batchNo: json['batch_no']?.toString(),
      thickness: json['thickness']?.toString(),
      width: json['width']?.toString(),
      length: json['length']?.toString(),
      weight: json['weight']?.toString(),
      scrapWeight: json['scrap_weight']?.toString(),
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
      'thickness': thickness,
      'width': width,
      'length': length,
      'weight': weight,
      'scrap_weight': scrapWeight,
      'image': image,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}
