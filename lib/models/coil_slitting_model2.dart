class MaterialData {
  final int materialId;
  final int inwardId;
  final double length;
  final double thickness;
  final double weight;
  final DateTime slitAt;
  final DateTime issuedAt;
  final int unitId;
  final int plantId;
  final int departmentId;
  final String image;

  MaterialData({
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

  // From JSON
  factory MaterialData.fromJson(Map<String, dynamic> json) {
    return MaterialData(
      materialId: json['material_id'],
      inwardId: json['inward_id'],
      length: (json['length'] as num).toDouble(),
      thickness: (json['thickness'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      slitAt: DateTime.parse(json['slit_at']),
      issuedAt: DateTime.parse(json['issued_at']),
      unitId: json['unit_id'],
      plantId: json['plant_id'],
      departmentId: json['department_id'],
      image: json['image'],
    );
  }

  // To JSON
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
