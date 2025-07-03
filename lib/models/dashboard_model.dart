class ProcessStageResponseModel {
  final String? status;
  final List<StageData>? data;

  ProcessStageResponseModel({
    this.status,
    this.data,
  });

  factory ProcessStageResponseModel.fromJson(Map<String, dynamic> json) {
    return ProcessStageResponseModel(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => StageData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class StageData {
  final String? title;
  final String? image;

  StageData({
    this.title,
    this.image,
  });

  factory StageData.fromJson(Map<String, dynamic> json) {
    return StageData(
      title: json['title'] as String?,
      image: json['image'] as String?,
    );
  }
}
