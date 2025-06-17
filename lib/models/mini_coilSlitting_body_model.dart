class MiniCoilSlittingBodyModel {
  final String? connectionId;
  final String? authCode;
  final String? scrapWeight;
  final String? batchNo;
  final List<CoilSlittingItem>? data;

  MiniCoilSlittingBodyModel({
    this.connectionId,
    this.authCode,
    this.scrapWeight,
    this.batchNo,
    this.data,
  });

  Map<String, dynamic> toJson() {
    return {
      'connection_id': connectionId,
      'auth_code': authCode,
      'scrap_weight': scrapWeight,
      'batch_no': batchNo,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}

class CoilSlittingItem {
  final String? inwardId;
  final String? machineId;
  final String? length;
  final String? width;
  final String? thickness;
  final String? expectedWeight;
  final String? weight;
  final String? image;

  CoilSlittingItem({
    this.inwardId,
    this.machineId,
    this.length,
    this.width,
    this.thickness,
    this.expectedWeight,
    this.weight,
    this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'inward_id': inwardId,
      'machine_id': machineId,
      'length': length,
      'width': width,
      'thickness': thickness,
      'expected_weight': expectedWeight,
      'weight': weight,
      'image': image,
    };
  }
}
