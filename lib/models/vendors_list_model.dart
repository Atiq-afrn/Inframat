class VendorListModel {
  final String success;
  final List<Vendor> data;

  VendorListModel({required this.success, required this.data});

  factory VendorListModel.fromJson(Map<String, dynamic> json) {
    return VendorListModel(
      success: json['success'],
      data: List<Vendor>.from(
        json['data'].map((item) => Vendor.fromJson(item)),
      ),
    );
  }
}

class Vendor {
  final int id;
  final String vendorName;
  final String createdAt;
  final String updatedAt;

  Vendor({
    required this.id,
    required this.vendorName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'],
      vendorName: json['vendor_name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
