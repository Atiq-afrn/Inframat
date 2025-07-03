class PunchOutModel {
  final String? status;
  final String? message;
  final PunchOutData? data;

  PunchOutModel({
    this.status,
    this.message,
    this.data,
  });

  factory PunchOutModel.fromJson(Map<String, dynamic> json) {
    return PunchOutModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] != null
          ? PunchOutData.fromJson(json['data'])
          : null,
    );
  }
}

class PunchOutData {
  final String? name;
  final String? role;
  final String? time;
  final Location? location;
  final String? image;
  final String? dateInfo;

  PunchOutData({
    this.name,
    this.role,
    this.time,
    this.location,
    this.image,
    this.dateInfo,
  });

  factory PunchOutData.fromJson(Map<String, dynamic> json) {
    return PunchOutData(
      name: json['name'] as String?,
      role: json['role'] as String?,
      time: json['time'] as String?,
      location: json['location'] != null
          ? Location.fromJson(json['location'])
          : null,
      image: json['image'] as String?,
      dateInfo: json['date_info'] as String?,
    );
  }
}

class Location {
  final String? lat;
  final String? long;

  Location({
    this.lat,
    this.long,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat'] as String?,
      long: json['long'] as String?,
    );
  }
}
