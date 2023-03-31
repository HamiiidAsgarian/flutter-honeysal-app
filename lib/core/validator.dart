// r'^
//   (?=.*[A-Z])       // should contain at least one upper case
//   (?=.*[a-z])       // should contain at least one lower case
//   (?=.*?[0-9])      // should contain at least one digit
//   (?=.*?[!@#\$&*~]) // should contain at least one Special character
//   .{8,}             // Must be at least 8 characters in length
// $
class Validators {
  static phoneValidator(value) {
    (value) {
      if (value != null && value.isNotEmpty && value.length == 10) {
        return null;
      }
      return "Please Enter in valid phone number";
    };
  }

  static phoneNumberValidator(value) {
    if (value == null ||
        value == "" ||
        !RegExp(r"^(\+\d{1,3}[- ]?)?\d{10}$").hasMatch(value.trim())) {
      return 'Please enter your phone number currectly';
    }
    return null;
  }

  ///should contain at least one upper case, should contain at least one lower case, should contain at least one digit,should contain at least one Special character,Must be at least 8 characters in length
  static passwordValidator(value) {
    if (value == null ||
        value == "" ||
        !RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$")
            .hasMatch(value.trim())) {
      return 'Please enter a valid password';
    }
    return null;
  }

  static stringInputsValidator(value) {
    if (value == null ||
        value == "" ||
        !RegExp(r"^([a-zA-Z]+[,.]?[ ]?|[a-zA-Z]+['-]?)+$")
            .hasMatch(value.trim())) {
      return 'Please enter a valid value';
    }
    return null;
  }

  static birthDayValidator(value) {
    ///dd/mm/yyyy
    if (value == null ||
        value == "" ||
        !RegExp(r"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$")
            .hasMatch(value.trim())) {
      return 'Please enter your birthday currectly';
    }
    return null;
  }

  static emailValidator(value) {
    if (value == null ||
        value == "" ||
        !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
            .hasMatch(value.trim())) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }

  static bankAccountValidator(value) {
    if (value == null ||
        value == "" ||
        !RegExp(r"^[0-9]*$").hasMatch(value.trim())) {
      return 'Please enter a valid bank account number';
    }
    return null;
  }
}
