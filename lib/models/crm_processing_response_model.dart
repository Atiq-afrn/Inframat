class ColdRollingMillBodyResponse {
  final String message;
  final ColdRollingMillData data;

  ColdRollingMillBodyResponse({
    required this.message,
    required this.data,
  });

  factory ColdRollingMillBodyResponse.fromJson(Map<String, dynamic> json) {
    return ColdRollingMillBodyResponse(
      message: json['message'],
      data: ColdRollingMillData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data.toJson(),
    };
  }
}

class ColdRollingMillData {
  final int inwardId;
  final String batchNo;
  final double thickness;
  final int width;
  final int length;
  final int weight;
  final int scrapWeight;
  final String image;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  ColdRollingMillData({
    required this.inwardId,
    required this.batchNo,
    required this.thickness,
    required this.width,
    required this.length,
    required this.weight,
    required this.scrapWeight,
    required this.image,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory ColdRollingMillData.fromJson(Map<String, dynamic> json) {
    return ColdRollingMillData(
      inwardId: json['inward_id'],
      batchNo: json['batch_no'],
      thickness: (json['thickness'] as num).toDouble(),
      width: json['width'],
      length: json['length'],
      weight: json['weight'],
      scrapWeight: json['scrap_weight'],
      image: json['image'],
      updatedAt: DateTime.parse(json['updated_at']),
      createdAt: DateTime.parse(json['created_at']),
      id: json['id'],
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
      'updated_at': updatedAt.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'id': id,
    };
  }
}
