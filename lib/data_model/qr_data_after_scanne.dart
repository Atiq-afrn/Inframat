class QrdataModelAfterscann {
  final String name;
  final List<BarcodeData> data;
  final ImageData image;

  QrdataModelAfterscann({
    required this.name,
    required this.data,
    required this.image,
  });

  factory QrdataModelAfterscann.fromJson(Map<String, dynamic> json) {
    return QrdataModelAfterscann(
      name: json['name'],
      data: (json['data'] as List)
          .map((item) => BarcodeData.fromJson(item))
          .toList(),
      image: ImageData.fromJson(json['image']),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'data': data.map((item) => item.toJson()).toList(),
        'image': image.toJson(),
      };
}

class BarcodeData {
  final List<Point>? corners;
  final String? displayValue;
  final int? format;
  final List<int>? rawBytes;
  final String? rawValue;
  final SizeData? size;
  final int? type;
  final UrlData? url;

  BarcodeData({
    this.corners,
    this.displayValue,
    this.format,
    this.rawBytes,
    this.rawValue,
    this.size,
    this.type,
    this.url,
  });

  factory BarcodeData.fromJson(Map<String, dynamic> json) {
    return BarcodeData(
      corners: (json['corners'] as List?)
          ?.map((item) => Point.fromJson(item))
          .toList(),
      displayValue: json['displayValue'],
      format: json['format'],
      rawBytes: List<int>.from(json['rawBytes'] ?? []),
      rawValue: json['rawValue'],
      size: json['size'] != null ? SizeData.fromJson(json['size']) : null,
      type: json['type'],
      url: json['url'] != null ? UrlData.fromJson(json['url']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'corners': corners?.map((e) => e.toJson()).toList(),
        'displayValue': displayValue,
        'format': format,
        'rawBytes': rawBytes,
        'rawValue': rawValue,
        'size': size?.toJson(),
        'type': type,
        'url': url?.toJson(),
      };
}

class Point {
  final double x;
  final double y;

  Point({required this.x, required this.y});

  factory Point.fromJson(Map<String, dynamic> json) => Point(
        x: (json['x'] as num).toDouble(),
        y: (json['y'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'x': x,
        'y': y,
      };
}

class SizeData {
  final double width;
  final double height;

  SizeData({required this.width, required this.height});

  factory SizeData.fromJson(Map<String, dynamic> json) => SizeData(
        width: (json['width'] as num).toDouble(),
        height: (json['height'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'width': width,
        'height': height,
      };
}

class UrlData {
  final String title;
  final String url;

  UrlData({required this.title, required this.url});

  factory UrlData.fromJson(Map<String, dynamic> json) => UrlData(
        title: json['title'] ?? '',
        url: json['url'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'url': url,
      };
}

class ImageData {
  final dynamic bytes;
  final double width;
  final double height;

  ImageData({
    required this.bytes,
    required this.width,
    required this.height,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
        bytes: json['bytes'], // You can add logic if needed
        width: (json['width'] as num).toDouble(),
        height: (json['height'] as num).toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'bytes': bytes,
        'width': width,
        'height': height,
      };
}
