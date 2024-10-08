class ProfileUpdateModel {
  String? name;
  String? location;
  String? gender;
  String? bloodGroup;

  ProfileUpdateModel({this.name, this.location, this.gender, this.bloodGroup});

  ProfileUpdateModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'];
    gender = json['gender'];
    bloodGroup = json['bloodGroup'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['location'] = location;
    data['gender'] = gender;
    data['bloodGroup'] = bloodGroup;
    return data;
  }
}
