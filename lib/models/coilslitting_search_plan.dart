class CoilSlittingPlanSearchResponseModel {
  final String? status;
  final String? message;
  final List<CoilSlittingPlanData>? data;

  CoilSlittingPlanSearchResponseModel({this.status, this.message, this.data});

  factory CoilSlittingPlanSearchResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CoilSlittingPlanSearchResponseModel(
      status: json['status']?.toString(),
      message: json['message']?.toString(),
      data:
          (json['data'] as List?)
              ?.map((e) => CoilSlittingPlanData.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class CoilSlittingPlanData {
  final String? id;
  final String? status;
  final String? inwardId;
  final String? batchNo;
  final String? vendorId;
  final String? numberOfSlits;
  final String? expectedLength;
  final String? expectedWidth;
  final String? expectedThickness;
  final String? expectedWeight;
  final String? expectedScrapWeight;
  final String? actualScrapWeight;
  final String? createdAt;
  final String? updatedAt;

  CoilSlittingPlanData({
    this.id,
    this.status,
    this.inwardId,
    this.batchNo,
    this.vendorId,
    this.numberOfSlits,
    this.expectedLength,
    this.expectedWidth,
    this.expectedThickness,
    this.expectedWeight,
    this.expectedScrapWeight,
    this.actualScrapWeight,
    this.createdAt,
    this.updatedAt,
  });

  factory CoilSlittingPlanData.fromJson(Map<String, dynamic> json) {
    return CoilSlittingPlanData(
      id: json['id']?.toString(),
      status: json['status']?.toString(),
      inwardId: json['inward_id']?.toString(),
      batchNo: json['batch_no']?.toString(),
      vendorId: json['vendor_id']?.toString(),
      numberOfSlits: json['number_of_slits']?.toString(),
      expectedLength: json['expected_length']?.toString(),
      expectedWidth: json['expected_width']?.toString(),
      expectedThickness: json['expected_thickness']?.toString(),
      expectedWeight: json['expected_weight']?.toString(),
      expectedScrapWeight: json['expected_scrap_weight']?.toString(),
      actualScrapWeight: json['actual_scrap_weight']?.toString(),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
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
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
