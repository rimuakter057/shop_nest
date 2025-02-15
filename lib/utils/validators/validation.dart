

class AppValidator{
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if(!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
    return 'Password must contain at least one special character.';
    }
return null;
  }

  static String? validatePhoneNumber(String?value){
    if(value == null || value.isEmpty){
      return 'Please enter a phone number';
    }
    final phoneRegex = RegExp(r'^\d{10}$');
    if(!phoneRegex.hasMatch(value)){
      return 'Please enter a valid phone number';
    }
    return null;
  }


}