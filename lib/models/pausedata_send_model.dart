class TimelineUpdateResponseModel {
  final String? status;
  final String? message;
  final TimelineData? data;

  TimelineUpdateResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory TimelineUpdateResponseModel.fromJson(Map<String, dynamic> json) {
    return TimelineUpdateResponseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] != null
          ? TimelineData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class TimelineData {
  final String? id;
  final String? reasonId;
  final String? userId;
  final String? machineId;
  final String? startTime;
  final String? endTime;
  final String? statusLog;
  final String? stageId;
  final String? createdAt;
  final String? updatedAt;

  TimelineData({
    this.id,
    this.reasonId,
    this.userId,
    this.machineId,
    this.startTime,
    this.endTime,
    this.statusLog,
    this.stageId,
    this.createdAt,
    this.updatedAt,
  });

  factory TimelineData.fromJson(Map<String, dynamic> json) {
    return TimelineData(
      id: json['id']?.toString(),
      reasonId: json['reason_id']?.toString(),
      userId: json['user_id']?.toString(),
      machineId: json['machine_id']?.toString(),
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      statusLog: json['status_log'] as String?,
      stageId: json['stage_id']?.toString(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reason_id': reasonId,
      'user_id': userId,
      'machine_id': machineId,
      'start_time': startTime,
      'end_time': endTime,
      'status_log': statusLog,
      'stage_id': stageId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
