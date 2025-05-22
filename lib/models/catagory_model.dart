class CatagoryModel {
  final String success;
  final List<CategoryData> data;

  CatagoryModel({required this.success, required this.data});

  factory CatagoryModel.fromJson(Map<String, dynamic> json) {
    return CatagoryModel(
      success: json['success'],
      data: List<CategoryData>.from(
        json['data'].map((x) => CategoryData.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.map((x) => x.toJson()).toList(),
    };
  }
}

class CategoryData {
  final int id;
  final String name;
  final int status;

  CategoryData({required this.id, required this.name, required this.status});

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json['id'],
      name: json['name'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
    };
  }
}
