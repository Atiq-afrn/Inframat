import 'dart:convert';

class TimelogResponseModel {
  final bool status;
  final String message;
  final TimelogData? data;

  TimelogResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory TimelogResponseModel.fromJson(Map<String, dynamic> json) {
    return TimelogResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? TimelogData.fromJson(json['data']) : null,
    );
  }
}

class TimelogData {
  final int machineId;
  final int userId;
  final String startTime;
  final String updatedAt;
  final String createdAt;
  final int id;
  final List<StatusLog> statusLog;
  final int? reasonId;

  TimelogData({
    required this.machineId,
    required this.userId,
    required this.startTime,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.statusLog,
    required this.reasonId,
  });

  factory TimelogData.fromJson(Map<String, dynamic> json) {
    List<StatusLog> parsedStatusLog = [];
    if (json['status_log'] != null) {
      try {
        final decoded = jsonDecode(json['status_log']);
        if (decoded is List) {
          parsedStatusLog = decoded.map((e) => StatusLog.fromJson(e)).toList();
        }
      } catch (e) {
        print("❗ Failed to parse status_log: $e");
      }
    }

    return TimelogData(
      machineId:
          json['machine_id'] is int
              ? json['machine_id']
              : int.tryParse(json['machine_id'].toString()) ?? 0,
      userId:
          json['user_id'] is int
              ? json['user_id']
              : int.tryParse(json['user_id'].toString()) ?? 0,
      startTime: json['start_time'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      createdAt: json['created_at'] ?? '',
      id:
          json['id'] is int
              ? json['id']
              : int.tryParse(json['id'].toString()) ?? 0,
      statusLog: parsedStatusLog,
      reasonId:
          json['reason_id'] != null
              ? int.tryParse(json['reason_id'].toString())
              : null,
    );
  }
}

class StatusLog {
  final String? pausedAt;
  final int? reasonId;

  StatusLog({this.pausedAt, this.reasonId});

  factory StatusLog.fromJson(Map<String, dynamic> json) {
    return StatusLog(
      pausedAt: json['paused_at'],
      reasonId:
          json['reason_id'] != null
              ? int.tryParse(json['reason_id'].toString())
              : null,
    );
  }
}
