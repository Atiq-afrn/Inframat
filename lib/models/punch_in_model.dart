class PunchInModel {
  final String status;
  final String message;
  final PunchInData data;

  PunchInModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PunchInModel.fromJson(Map<String, dynamic> json) {
    return PunchInModel(
      status: json['status'],
      message: json['message'],
      data: PunchInData.fromJson(json['data']),
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

class PunchInData {
  final String time;
  final String date;
  final Location location;
  final String image;

  PunchInData({
    required this.time,
    required this.date,
    required this.location,
    required this.image,
  });

  factory PunchInData.fromJson(Map<String, dynamic> json) {
    return PunchInData(
      time: json['time'],
      date: json['date'],
      location: Location.fromJson(json['location']),
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'date': date,
      'location': location.toJson(),
      'image': image,
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
