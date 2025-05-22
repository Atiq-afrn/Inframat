class SubCategoryModel {
  final String success;
  final List<MaterialItem> data;

  SubCategoryModel({
    required this.success,
    required this.data,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      success: json['success'],
      data: List<MaterialItem>.from(
        json['data'].map((item) => MaterialItem.fromJson(item)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class MaterialItem {
  final int id;
  final String name;

  MaterialItem({
    required this.id,
    required this.name,
  });

  factory MaterialItem.fromJson(Map<String, dynamic> json) {
    return MaterialItem(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
