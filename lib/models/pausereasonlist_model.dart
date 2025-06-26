class IssueResponselistModel {
  final String? success;
  final List<IssueData>? data;

  IssueResponselistModel({
    this.success,
    this.data,
  });

  factory IssueResponselistModel.fromJson(Map<String, dynamic> json) {
    return IssueResponselistModel(
      success: json['success'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => IssueData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class IssueData {
  final String? id;
  final String? name;

  IssueData({
    this.id,
    this.name,
  });

  factory IssueData.fromJson(Map<String, dynamic> json) {
    return IssueData(
      id: json['id']?.toString(),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
