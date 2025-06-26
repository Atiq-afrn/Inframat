class CuttingProcessSaveResponseModel {
  String? status;
  String? message;
  CuttingProcessSaveData? data;

  CuttingProcessSaveResponseModel({
    this.status,
    this.message,
    this.data,
  });

  factory CuttingProcessSaveResponseModel.fromJson(Map<String, dynamic> json) {
    return CuttingProcessSaveResponseModel(
      status: json['status']?.toString(),
      message: json['message']?.toString(),
      data: json['data'] != null
          ? CuttingProcessSaveData.fromJson(json['data'])
          : null,
    );
  }
}

class CuttingProcessSaveData {
  String? inwardId;
  String? machineId;
  String? batchNo;
  String? lengthRequired;
  String? widthRequired;
  String? noOfPieces;
  String? updatedAt;
  String? createdAt;
  String? id;

  CuttingProcessSaveData({
    this.inwardId,
    this.machineId,
    this.batchNo,
    this.lengthRequired,
    this.widthRequired,
    this.noOfPieces,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory CuttingProcessSaveData.fromJson(Map<String, dynamic> json) {
    return CuttingProcessSaveData(
      inwardId: json['inward_id']?.toString(),
      machineId: json['machine_id']?.toString(),
      batchNo: json['batch_no']?.toString(),
      lengthRequired: json['length_required']?.toString(),
      widthRequired: json['width_required']?.toString(),
      noOfPieces: json['no_of_pieces']?.toString(),
      updatedAt: json['updated_at']?.toString(),
      createdAt: json['created_at']?.toString(),
      id: json['id']?.toString(),
    );
  }
}
