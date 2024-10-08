class AppValidators {
  static String? pinValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a PIN';
    }
    if (value.length != 5) {
      return 'PIN must be exactly 5 digits long';
    }
    if (!RegExp(r'^\d{5}$').hasMatch(value)) {
      return 'PIN must contain only digits';
    }
    return null;
  }

  static String? phoneValidator(value) {
    final RegExp bdNumberRegex = RegExp(r"^(?:\+?88|0088)?01[3456789]\d{8}$");
    if (value!.isEmpty) {
      return 'Please enter your mobile number';
    }
    if (!bdNumberRegex.hasMatch(value)) {
      return 'Please enter a valid mobile number';
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  static String? locationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your location';
    }
    return null;
  }

  static String? desValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter cause for request';
    }
    return null;
  }

  static String? dateTimeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please pick date & time';
    }
    return null;
  }
}
