// To parse this JSON data, do
//
//     final getConnection = getConnectionFromJson(jsonString);

import 'dart:convert';

GetConnection getConnectionFromJson(String str) => GetConnection.fromJson(json.decode(str));

String getConnectionToJson(GetConnection data) => json.encode(data.toJson());

class GetConnection {
    final String? status;
    final String? connectionId;
    final String? message;

    GetConnection({
        this.status,
        this.connectionId,
        this.message,
    });

    factory GetConnection.fromJson(Map<String, dynamic> json) => GetConnection(
        status: json["status"],
        connectionId: json["connection_id"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "connection_id": connectionId,
        "message": message,
    };
}
