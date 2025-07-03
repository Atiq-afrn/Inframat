class TimelogResponseModel {
  final bool status;
  final String message;
  final MachineTimelineData data;

  TimelogResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TimelogResponseModel.fromJson(Map<String, dynamic> json) {
    return TimelogResponseModel(
      status: json['status'],
      message: json['message'],
      data: MachineTimelineData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class MachineTimelineData {
  final int machineId;
  final int userId;
  final String startTime;
  final String updatedAt;
  final String createdAt;
  final int id;

  MachineTimelineData({
    required this.machineId,
    required this.userId,
    required this.startTime,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory MachineTimelineData.fromJson(Map<String, dynamic> json) {
    return MachineTimelineData(
      machineId: json['machine_id'],
      userId: json['user_id'],
      startTime: json['start_time'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'machine_id': machineId,
      'user_id': userId,
      'start_time': startTime,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}
