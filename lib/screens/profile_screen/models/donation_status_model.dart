class DonationStatusModel {
  bool? availableForDonate;

  DonationStatusModel({this.availableForDonate});

  DonationStatusModel.fromJson(Map<String, dynamic> json) {
    availableForDonate = json['availableForDonate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['availableForDonate'] = availableForDonate;
    return data;
  }
}
