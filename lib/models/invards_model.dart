class InvardModel1 {
  final String status;
  final int inwardId;
  final String pieces;
  final String message;

  InvardModel1({
    required this.status,
    required this.inwardId,
    required this.pieces,
    required this.message,
  });

  factory InvardModel1.fromJson(Map<String, dynamic> json) {
    return InvardModel1(
      status: json['status'],
      inwardId: json['inward_id'],
      pieces: json['pieces'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'inward_id': inwardId,
      'pieces': pieces,
      'message': message,
    };
  }
}
