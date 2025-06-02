// pickling_result_model.dart

class PicklingProcessModel {
  final String connectionId;
  final String authCode;
  final int inwardId;
  final String batchNo;
  final double actualWeight;
  final double picklingLoss;
  final String image; // base64 string

  PicklingProcessModel({
    required this.connectionId,
    required this.authCode,
    required this.inwardId,
    required this.batchNo,
    required this.actualWeight,
    required this.picklingLoss,
    required this.image,
  });

  factory PicklingProcessModel.fromJson(Map<String, dynamic> json) {
    return PicklingProcessModel(
      connectionId: json['connection_id'] ?? '',
      authCode: json['auth_code'] ?? '',
      inwardId: json['inward_id'],
      batchNo: json['batch_no'],
      actualWeight: (json['actual_weight'] as num).toDouble(),
      picklingLoss: (json['pickling_loss'] as num).toDouble(),
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'connection_id': connectionId,
      'auth_code': authCode,
      'inward_id': inwardId,
      'batch_no': batchNo,
      'actual_weight': actualWeight,
      'pickling_loss': picklingLoss,
      'image': image,
    };
  }
}
