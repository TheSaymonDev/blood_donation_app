class SeekerPostModel {
  String? bloodGroup;
  String? location;
  String? description;
  String? cause;
  String? dateTime;
  String? unit;

  SeekerPostModel({
    this.bloodGroup,
    this.location,
    this.description,
    this.cause,
    this.dateTime,
    this.unit,
  });

  SeekerPostModel.fromJson(Map<String, dynamic> json) {
    bloodGroup = json['bloodGroup'];
    location = json['location'];
    description = json['description'];
    cause = json['cause'];
    dateTime = json['dateTime'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bloodGroup'] = bloodGroup;
    data['location'] = location;
    data['description'] = description;
    data['cause'] = cause;
    data['dateTime'] = dateTime;
    data['unit'] = unit;
    return data;
  }
}
