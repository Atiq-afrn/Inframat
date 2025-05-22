class QrCodeModel {
  final String shiftName;
  final String plantName;
  final String unitName;
  final String workstationName;
  final String message;

  QrCodeModel({
    required this.shiftName,
    required this.plantName,
    required this.unitName,
    required this.workstationName,
    required this.message,
  });

  factory QrCodeModel.fromJson(Map<String, dynamic> json) {
    return QrCodeModel(
      shiftName: json['shift_name'],
      plantName: json['plant_name'],
      unitName: json['unit_name'],
      workstationName: json['workstation_name'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shift_name': shiftName,
      'plant_name': plantName,
      'unit_name': unitName,
      'workstation_name': workstationName,
      'message': message,
    };
  }
}
