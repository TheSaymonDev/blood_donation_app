class CurrentUserModel {
  bool? success;
  String? message;
  ProfileData? data;

  CurrentUserModel({this.success, this.message, this.data});

  CurrentUserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileData {
  String? sId;
  String? phone;
  String? otp;
  bool? isOtpVerified;
  bool? availableForDonate;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? bloodGroup;
  String? gender;
  String? location;
  String? name;
  String? photo;

  ProfileData(
      {this.sId,
        this.phone,
        this.otp,
        this.isOtpVerified,
        this.availableForDonate,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.bloodGroup,
        this.gender,
        this.location,
        this.name,
        this.photo});

  ProfileData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
    otp = json['otp'];
    isOtpVerified = json['isOtpVerified'];
    availableForDonate = json['availableForDonate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    bloodGroup = json['bloodGroup'];
    gender = json['gender'];
    location = json['location'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['phone'] = phone;
    data['otp'] = otp;
    data['isOtpVerified'] = isOtpVerified;
    data['availableForDonate'] = availableForDonate;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['bloodGroup'] = bloodGroup;
    data['gender'] = gender;
    data['location'] = location;
    data['name'] = name;
    data['photo'] = photo;
    return data;
  }
}
