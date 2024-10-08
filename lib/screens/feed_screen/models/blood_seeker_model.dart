class BloodSeekerModel {
  bool? success;
  String? message;
  List<BloodSeekerData>? data;

  BloodSeekerModel({this.success, this.message, this.data});

  BloodSeekerModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BloodSeekerData>[];
      json['data'].forEach((v) {
        data!.add(BloodSeekerData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BloodSeekerData {
  String? sId;
  User? user;
  String? bloodGroup;
  String? location;
  String? description;
  String? photo;
  String? cause;
  String? dateTime;
  String? unit;
  int? likesCount;
  int? iV;

  BloodSeekerData(
      {this.sId,
        this.user,
        this.bloodGroup,
        this.location,
        this.description,
        this.photo,
        this.cause,
        this.dateTime,
        this.unit,
        this.likesCount,
        this.iV});

  BloodSeekerData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    bloodGroup = json['bloodGroup'];
    location = json['location'];
    description = json['description'];
    photo = json['photo'];
    cause = json['cause'];
    dateTime = json['dateTime'];
    unit = json['unit'];
    likesCount = json['likesCount'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['bloodGroup'] = bloodGroup;
    data['location'] = location;
    data['description'] = description;
    data['photo'] = photo;
    data['cause'] = cause;
    data['dateTime'] = dateTime;
    data['unit'] = unit;
    data['likesCount'] = likesCount;
    data['__v'] = iV;
    return data;
  }
}

class User {
  String? sId;
  String? phone;
  bool? availableForDonate;
  String? bloodGroup;
  String? gender;
  String? location;
  String? name;
  String? photo;

  User(
      {this.sId,
        this.phone,
        this.availableForDonate,
        this.bloodGroup,
        this.gender,
        this.location,
        this.name,
        this.photo});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phone = json['phone'];
    availableForDonate = json['availableForDonate'];
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
    data['availableForDonate'] = availableForDonate;
    data['bloodGroup'] = bloodGroup;
    data['gender'] = gender;
    data['location'] = location;
    data['name'] = name;
    data['photo'] = photo;
    return data;
  }
}
