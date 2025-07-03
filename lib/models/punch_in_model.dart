class PunchInModel {
  final String? status;
  final String? message;
  final PunchInData? data;

  PunchInModel({this.status, this.message, this.data});

  factory PunchInModel.fromJson(Map<String, dynamic> json) {
    return PunchInModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] != null ? PunchInData.fromJson(json['data']) : null,
    );
  }
}

class PunchInData {
  final String? name;
  final String? role;
  final int? userId;
  final String? time;
  final String? date;
  final Location? location;
  final String? image;

  PunchInData({
    this.name,
    this.role,
    this.userId,
    this.time,
    this.date,
    this.location,
    this.image,
  });

  factory PunchInData.fromJson(Map<String, dynamic> json) {
    return PunchInData(
      name: json['name'] as String?,
      role: json['role'] as String?,
      userId: json['user_id'] as int?,
      time: json['time'] as String?,
      date: json['date'] as String?,
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
      image: json['image'] as String?,
    );
  }
}

class Location {
  final String? lat;
  final String? long;

  Location({this.lat, this.long});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(lat: json['lat'] as String?, long: json['long'] as String?);
  }
}
