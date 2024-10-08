class MyRequestModel {
  bool? success;
  String? message;
  List<Data>? data;

  MyRequestModel({this.success, this.message, this.data});

  MyRequestModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  String? sId;
  String? bloodGroup;
  String? location;
  String? description;
  String? photo;
  String? cause;
  String? dateTime;
  String? unit;
  int? likesCount;
  int? iV;

  Data(
      {this.sId,
        this.bloodGroup,
        this.location,
        this.description,
        this.photo,
        this.cause,
        this.dateTime,
        this.unit,
        this.likesCount,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
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
