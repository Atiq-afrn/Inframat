class CoilSlittingResponseModel {
  final String status;
  final String message;
  final List<CoilSlittingEntry> data;

  CoilSlittingResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CoilSlittingResponseModel.fromJson(Map<String, dynamic> json) {
    return CoilSlittingResponseModel(
      status: json['status'],
      message: json['message'],
      data: List<CoilSlittingEntry>.from(
        json['data'].map((x) => CoilSlittingEntry.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((x) => x.toJson()).toList(),
    };
  }
}

class CoilSlittingEntry {
  final String batchNo;
  final int inwardId;
  final int length;
  final int width;
  final double thickness;
  final int expectedWeight;
  final double weight;
  final int machineId;
  final String image;
  final String updatedAt;
  final String createdAt;
  final int id;

  CoilSlittingEntry({
    required this.batchNo,
    required this.inwardId,
    required this.length,
    required this.width,
    required this.thickness,
    required this.expectedWeight,
    required this.weight,
    required this.machineId,
    required this.image,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory CoilSlittingEntry.fromJson(Map<String, dynamic> json) {
    return CoilSlittingEntry(
      batchNo: json['batch_no'],
      inwardId: json['inward_id'],
      length: json['length'],
      width: json['width'],
      thickness: json['thickness'].toDouble(),
      expectedWeight: json['expected_weight'],
      weight: json['weight'].toDouble(),
      machineId: json['machine_id'],
      image: json['image'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'batch_no': batchNo,
      'inward_id': inwardId,
      'length': length,
      'width': width,
      'thickness': thickness,
      'expected_weight': expectedWeight,
      'weight': weight,
      'machine_id': machineId,
      'image': image,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}
