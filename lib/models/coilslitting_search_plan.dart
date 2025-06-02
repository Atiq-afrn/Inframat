class CoilSlittingPlanSearchResponseModel {
  final String status;
  final String message;
  final List<CoilSlittingPlanData> data;

  CoilSlittingPlanSearchResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CoilSlittingPlanSearchResponseModel.fromJson(Map<String, dynamic> json) {
    return CoilSlittingPlanSearchResponseModel(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List)
          .map((e) => CoilSlittingPlanData.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class CoilSlittingPlanData {
  final int id;
  final int status;
  final int inwardId;
  final String batchNo;
  final int vendorId;
  final int numberOfSlits;
  final int expectedLength;
  final int expectedWidth;
  final int expectedThickness;
  final String expectedWeight;
  final String expectedScrapWeight;
  final String actualScrapWeight;
  final DateTime createdAt;
  final DateTime updatedAt;

  CoilSlittingPlanData({
    required this.id,
    required this.status,
    required this.inwardId,
    required this.batchNo,
    required this.vendorId,
    required this.numberOfSlits,
    required this.expectedLength,
    required this.expectedWidth,
    required this.expectedThickness,
    required this.expectedWeight,
    required this.expectedScrapWeight,
    required this.actualScrapWeight,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CoilSlittingPlanData.fromJson(Map<String, dynamic> json) {
    return CoilSlittingPlanData(
      id: json['id'],
      status: json['status'],
      inwardId: json['inward_id'],
      batchNo: json['batch_no'],
      vendorId: json['vendor_id'],
      numberOfSlits: json['number_of_slits'],
      expectedLength: json['expected_length'],
      expectedWidth: json['expected_width'],
      expectedThickness: json['expected_thickness'],
      expectedWeight: json['expected_weight'],
      expectedScrapWeight: json['expected_scrap_weight'],
      actualScrapWeight: json['actual_scrap_weight'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'inward_id': inwardId,
      'batch_no': batchNo,
      'vendor_id': vendorId,
      'number_of_slits': numberOfSlits,
      'expected_length': expectedLength,
      'expected_width': expectedWidth,
      'expected_thickness': expectedThickness,
      'expected_weight': expectedWeight,
      'expected_scrap_weight': expectedScrapWeight,
      'actual_scrap_weight': actualScrapWeight,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
