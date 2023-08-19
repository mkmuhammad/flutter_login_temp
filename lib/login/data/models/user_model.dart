class UserModel {
  String? phoneNumber;
  String? fullName;
  List<dynamic>? patientProfiles;
  String? id;

  UserModel({
    this.phoneNumber,
    this.fullName,
    this.patientProfiles,
    this.id,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      phoneNumber: json['PhoneNumber'] as String?,
      fullName: json['FullName'] as String?,
      patientProfiles: json['PatientProfiles'] as List<dynamic>?,
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'fullName': fullName,
      'patientProfiles': patientProfiles,
      'id': id,
    };
  }
}
