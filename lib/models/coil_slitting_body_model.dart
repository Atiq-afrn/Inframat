class CoilSlittingBodyModel {
  String inwardId;
  String machineId;
  String length;
  String expectedWeight;
  String width;
  String thickness;
  String weight;
  String image;

  CoilSlittingBodyModel({
    required this.inwardId,
    required this.machineId,
    required this.length,
    required this.expectedWeight,
    required this.width,
    required this.thickness,
    required this.weight,
    required this.image,
  });

  // Create an instance from a JSON map
  factory CoilSlittingBodyModel.fromJson(Map<String, dynamic> json) {
    return CoilSlittingBodyModel(
      inwardId: json['inward_id'].toString(),
      machineId: json['machine_id'].toString(),
      length: json['length'].toString(),
      expectedWeight: json['expected_weight'].toString(),
      width: json['width'].toString(),
      thickness: json['thickness'].toString(),
      weight: json['weight'].toString(),
      image: json['image'].toString(),
    );
  }

  // Convert the model instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'inward_id': inwardId,
      'machine_id': machineId,
      'length': length,
      'expected_weight': expectedWeight,
      'width': width,
      'thickness': thickness,
      'weight': weight,
      'image': image,
    };
  }
}
