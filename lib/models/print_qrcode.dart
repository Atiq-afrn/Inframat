class QrResponseModel {
  final String status;
  final String imageUrl;

  QrResponseModel({required this.status, required this.imageUrl});

  factory QrResponseModel.fromJson(Map<String, dynamic> json) {
    return QrResponseModel(
      status: json['status'] ?? '',
      imageUrl: json['image_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'status': status, 'image_url': imageUrl};
  }
}
