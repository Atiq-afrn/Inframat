class PunchOutModel {
  final String status;
  final String message;
  final PunchOutData data;

  PunchOutModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PunchOutModel.fromJson(Map<String, dynamic> json) {
    return PunchOutModel(
      status: json['status'],
      message: json['message'],
      data: PunchOutData.fromJson(json['data']),
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

class PunchOutData {
  final String time;
  final Location location;
  final String image;
  final String dateInfo;

  PunchOutData({
    required this.time,
    required this.location,
    required this.image,
    required this.dateInfo,
  });

  factory PunchOutData.fromJson(Map<String, dynamic> json) {
    return PunchOutData(
      time: json['time'],
      location: Location.fromJson(json['location']),
      image: json['image'],
      dateInfo: json['date_info'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'location': location.toJson(),
      'image': image,
      'date_info': dateInfo,
    };
  }
}

class Location {
  final String lat;
  final String long;

  Location({
    required this.lat,
    required this.long,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat'],
      long: json['long'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'long': long,
    };
  }
}
