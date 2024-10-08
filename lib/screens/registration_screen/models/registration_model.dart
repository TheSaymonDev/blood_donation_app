class RegistrationModel {
  String? name;
  String? phone;
  String? password;
  String? location;
  String? gender;
  String? bloodGroup;

  RegistrationModel({this.name, this.phone, this.password, this.location, this.gender, this.bloodGroup});

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    password = json['password'];
    location = json['location'];
    gender = json['gender'];
    bloodGroup = json['bloodGroup'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['password'] = password;
    data['location'] = location;
    data['gender'] = gender;
    data['bloodGroup'] = bloodGroup;
    return data;
  }
}
