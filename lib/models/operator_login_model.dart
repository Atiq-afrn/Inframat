class OperatorLoginModel {
  final String message;
  final Operator operator;
  final String authCode;

  OperatorLoginModel({
    required this.message,
    required this.operator,
    required this.authCode,
  });

  factory OperatorLoginModel.fromJson(Map<String, dynamic> json) {
    return OperatorLoginModel(
      message: json['message'],
      operator: Operator.fromJson(json['operator']),
      authCode: json['auth_code'],
    );
  }

  Map<String, dynamic> toJson() => {
        'message': message,
        'operator': operator.toJson(),
        'auth_code': authCode,
      };
}

class Operator {
  final int id;
  final String name;
  final String mobile;
  final int mobileVerified;
  final String email;
  final String? emailVerifiedAt;
  final int role;
  final int status;
  final String state;
  final String city;
  final int pincode;
  final String address;
  final String religion;
  final String nationality;
  final String citizenship;
  final String dob;
  final String gender;
  final String maritialStatus;
  final String bloodGroup;
  final String? image;
  final dynamic userId;
  final String? emergencyName;
  final String? emergencyNumber;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final String? fcmToken;
  final dynamic plantId;
  final dynamic unitId;
  final dynamic functionalAreaId;
  final String? responsibility;
  final String? shift;
  final String? version;
  final String? designation;
  final String? doj;
  final String? deviceCode;
  final String? employeeCode;
  final String? adhar;

  Operator({
    required this.id,
    required this.name,
    required this.mobile,
    required this.mobileVerified,
    required this.email,
    this.emailVerifiedAt,
    required this.role,
    required this.status,
    required this.state,
    required this.city,
    required this.pincode,
    required this.address,
    required this.religion,
    required this.nationality,
    required this.citizenship,
    required this.dob,
    required this.gender,
    required this.maritialStatus,
    required this.bloodGroup,
    this.image,
    this.userId,
    this.emergencyName,
    this.emergencyNumber,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.fcmToken,
    this.plantId,
    this.unitId,
    this.functionalAreaId,
    this.responsibility,
    this.shift,
    this.version,
    this.designation,
    this.doj,
    this.deviceCode,
    this.employeeCode,
    this.adhar,
  });

  factory Operator.fromJson(Map<String, dynamic> json) {
    return Operator(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      mobileVerified: json['mobile_verified'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      role: json['role'],
      status: json['status'],
      state: json['state'],
      city: json['city'],
      pincode: json['pincode'],
      address: json['address'],
      religion: json['religion'],
      nationality: json['nationality'],
      citizenship: json['citizenship'],
      dob: json['dob'],
      gender: json['gender'],
      maritialStatus: json['maritial_status'],
      bloodGroup: json['blood_group'],
      image: json['image'],
      userId: json['user_id'],
      emergencyName: json['emergency_name'],
      emergencyNumber: json['emergency_number'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      fcmToken: json['fcm_token'],
      plantId: json['plant_id'],
      unitId: json['unit_id'],
      functionalAreaId: json['functional_area_id'],
      responsibility: json['responsibility'],
      shift: json['shift'],
      version: json['version'],
      designation: json['designation'],
      doj: json['doj'],
      deviceCode: json['device_code'],
      employeeCode: json['employee_code'],
      adhar: json['adhar'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'mobile': mobile,
        'mobile_verified': mobileVerified,
        'email': email,
        'email_verified_at': emailVerifiedAt,
        'role': role,
        'status': status,
        'state': state,
        'city': city,
        'pincode': pincode,
        'address': address,
        'religion': religion,
        'nationality': nationality,
        'citizenship': citizenship,
        'dob': dob,
        'gender': gender,
        'maritial_status': maritialStatus,
        'blood_group': bloodGroup,
        'image': image,
        'user_id': userId,
        'emergency_name': emergencyName,
        'emergency_number': emergencyNumber,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'deleted_at': deletedAt,
        'fcm_token': fcmToken,
        'plant_id': plantId,
        'unit_id': unitId,
        'functional_area_id': functionalAreaId,
        'responsibility': responsibility,
        'shift': shift,
        'version': version,
        'designation': designation,
        'doj': doj,
        'device_code': deviceCode,
        'employee_code': employeeCode,
        'adhar': adhar,
      };
}
