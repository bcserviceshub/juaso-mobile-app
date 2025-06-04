
class StringValidators {
  static String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return '';
  }

  static bool? validateBoolEmail(String value) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
  }

  static bool? validateBoolPhone(String value) {
    print(value);
    return RegExp(r'^[0-9]{10}$').hasMatch(value);
  }

  static String validatePhone(String value) {
    if (value.isEmpty) {
      return 'Phone number can\'t be empty';
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return "";
  }

 static String validatePassword(String value, {bool isOtp = false}) {
  if (value.isEmpty) {
    return '${isOtp ? "OTP" : "Password"} cannot be empty';
  }

  if (isOtp) {
    if (value.length != 4 || !RegExp(r'^\d{4}$').hasMatch(value)) {
      return 'OTP must be exactly 4 digits';
    }
  } else {
    if (value.length < 6) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[!@#\$&*~_+=`%^()-]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
  }

  return "";
}


 
}
