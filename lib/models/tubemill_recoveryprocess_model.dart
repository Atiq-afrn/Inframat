class TubeMillRecoveryprocessModel {
  String? message;
  TubeMillReportData? data;

  TubeMillRecoveryprocessModel({this.message, this.data});

  factory TubeMillRecoveryprocessModel.fromJson(Map<String, dynamic> json) {
    return TubeMillRecoveryprocessModel(
      message: json['message']?.toString(),
      data:
          json['data'] != null
              ? TubeMillReportData.fromJson(json['data'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'data': data?.toJson()};
  }
}

class TubeMillReportData {
  String? tubeMillId;
  String? open;
  String? joint;
  String? zincBlack;
  String? pinhole;
  String? toolProblem;
  String? bend;
  String? babri;
  String? accumulatorScrap;
  String? updatedAt;
  String? createdAt;
  String? id;

  TubeMillReportData({
    this.tubeMillId,
    this.open,
    this.joint,
    this.zincBlack,
    this.pinhole,
    this.toolProblem,
    this.bend,
    this.babri,
    this.accumulatorScrap,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory TubeMillReportData.fromJson(Map<String, dynamic> json) {
    return TubeMillReportData(
      tubeMillId: json['tube_mill_id']?.toString(),
      open: json['open']?.toString(),
      joint: json['joint']?.toString(),
      zincBlack: json['zinc_black']?.toString(),
      pinhole: json['pinhole']?.toString(),
      toolProblem: json['tool_problem']?.toString(),
      bend: json['bend']?.toString(),
      babri: json['babri']?.toString(),
      accumulatorScrap: json['accumulator_scrap']?.toString(),
      updatedAt: json['updated_at']?.toString(),
      createdAt: json['created_at']?.toString(),
      id: json['id']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tube_mill_id': tubeMillId,
      'open': open,
      'joint': joint,
      'zinc_black': zincBlack,
      'pinhole': pinhole,
      'tool_problem': toolProblem,
      'bend': bend,
      'babri': babri,
      'accumulator_scrap': accumulatorScrap,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}
