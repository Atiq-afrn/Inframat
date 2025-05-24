class QrCodeModel {
  final String shiftName;
  final String plantName;
  final int machineId;
  final int shiftId;
  final int siteId;
  final int plantId;
  final String qrCode;
  final String siteName;
  final String machineName;
  final String workstationName;
  final String message;

  QrCodeModel({
    required this.shiftName,
    required this.plantName,
    required this.machineId,
    required this.shiftId,
    required this.siteId,
    required this.plantId,
    required this.qrCode,
    required this.siteName,
    required this.machineName,
    required this.workstationName,
    required this.message,
  });

  factory QrCodeModel.fromJson(Map<String, dynamic> json) {
    return QrCodeModel(
      shiftName: json['shift_name'],
      plantName: json['plant_name'],
      machineId: json['machine_id'],
      shiftId: json['shift_id'],
      siteId: json['site_id'],
      plantId: json['plant_id'],
      qrCode: json['qr_code'],
      siteName: json['site_name'],
      machineName: json['machine_name'],
      workstationName: json['workstation_name'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shift_name': shiftName,
      'plant_name': plantName,
      'machine_id': machineId,
      'shift_id': shiftId,
      'site_id': siteId,
      'plant_id': plantId,
      'qr_code': qrCode,
      'site_name': siteName,
      'machine_name': machineName,
      'workstation_name': workstationName,
      'message': message,
    };
  }
}
