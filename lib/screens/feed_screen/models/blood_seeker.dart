class BloodDonor {
  final String userPhoto;
  final String userName;
  final String bloodGroup;
  final String time;
  final String location;
  final String description;
  final String imgUrl;
  final String acceptedCount;
  final String donatedCount;
  final String likeCount;

  BloodDonor(
      {required this.userPhoto,
      required this.userName,
      required this.bloodGroup,
      required this.time,
      required this.location,
      required this.description,
      required this.imgUrl,
      required this.acceptedCount,
      required this.donatedCount,
      required this.likeCount});
}
