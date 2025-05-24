class CoilSlittingModel2 {
  final String connectionId;
  final String authCode;
  final List<MaterialEntry> data;

  CoilSlittingModel2({
    required this.connectionId,
    required this.authCode,
    required this.data,
  });

  factory CoilSlittingModel2.fromJson(Map<String, dynamic> json) {
    return CoilSlittingModel2(
      connectionId: json['connection_id'],
      authCode: json['auth_code'],
      data: (json['data'] as List<dynamic>)
          .map((item) => MaterialEntry.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'connection_id': connectionId,
      'auth_code': authCode,
      'data': data.map((entry) => entry.toJson()).toList(),
    };
  }
}

class MaterialEntry {
  final int materialId;
  final int inwardId;
  final int length;
  final double thickness;
  final int weight;
  final DateTime slitAt;
  final DateTime issuedAt;
  final int unitId;
  final int plantId;
  final int departmentId;
  final String image;

  MaterialEntry({
    required this.materialId,
    required this.inwardId,
    required this.length,
    required this.thickness,
    required this.weight,
    required this.slitAt,
    required this.issuedAt,
    required this.unitId,
    required this.plantId,
    required this.departmentId,
    required this.image,
  });

  factory MaterialEntry.fromJson(Map<String, dynamic> json) {
    return MaterialEntry(
      materialId: json['material_id'],
      inwardId: json['inward_id'],
      length: json['length'],
      thickness: (json['thickness'] as num).toDouble(),
      weight: json['weight'],
      slitAt: DateTime.parse(json['slit_at']),
      issuedAt: DateTime.parse(json['issued_at']),
      unitId: json['unit_id'],
      plantId: json['plant_id'],
      departmentId: json['department_id'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'material_id': materialId,
      'inward_id': inwardId,
      'length': length,
      'thickness': thickness,
      'weight': weight,
      'slit_at': slitAt.toIso8601String(),
      'issued_at': issuedAt.toIso8601String(),
      'unit_id': unitId,
      'plant_id': plantId,
      'department_id': departmentId,
      'image': image,
    };
  }
}
