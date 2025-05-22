class CoilSlittingModel {
  final String message;
  final List<CoilSlittingEntry> data;

  CoilSlittingModel({
    required this.message,
    required this.data,
  });

  factory CoilSlittingModel.fromJson(Map<String, dynamic> json) {
    return CoilSlittingModel(
      message: json['message'],
      data: (json['data'] as List)
          .map((item) => CoilSlittingEntry.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data.map((e) => e.toJson()).toList(),
      };
}

class CoilSlittingEntry {
  final int materialId;
  final int inwardId;
  final int length;
  final double thickness;
  final int weight;
  final String slitAt;
  final String issuedAt;
  final int departmentId;
  final int unit;
  final int plant;
  final String image;
  final String updatedAt;
  final String createdAt;
  final int id;

  CoilSlittingEntry({
    required this.materialId,
    required this.inwardId,
    required this.length,
    required this.thickness,
    required this.weight,
    required this.slitAt,
    required this.issuedAt,
    required this.departmentId,
    required this.unit,
    required this.plant,
    required this.image,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory CoilSlittingEntry.fromJson(Map<String, dynamic> json) {
    return CoilSlittingEntry(
      materialId: json['material_id'],
      inwardId: json['inward_id'],
      length: json['length'],
      thickness: (json['thickness'] as num).toDouble(),
      weight: json['weight'],
      slitAt: json['slit_at'],
      issuedAt: json['issued_at'],
      departmentId: json['department_id'],
      unit: json['unit'],
      plant: json['plant'],
      image: json['image'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'material_id': materialId,
        'inward_id': inwardId,
        'length': length,
        'thickness': thickness,
        'weight': weight,
        'slit_at': slitAt,
        'issued_at': issuedAt,
        'department_id': departmentId,
        'unit': unit,
        'plant': plant,
        'image': image,
        'updated_at': updatedAt,
        'created_at': createdAt,
        'id': id,
      };
}
