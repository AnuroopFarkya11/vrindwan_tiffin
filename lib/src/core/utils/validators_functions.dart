bool isText(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;

  if (isRequired && (inputString == null || inputString.isEmpty)) {
    return false;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'[a-zA-Z]+';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

bool isValidEmail(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;

  if (isRequired && (inputString == null || inputString.isEmpty)) {
    return false;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern =
        r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

bool isValidPhone(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;

  if (isRequired && (inputString == null || inputString.isEmpty)) {
    return false;
  }

  if (inputString != null && inputString.isNotEmpty) {
    if (inputString.length > 16 || inputString.length < 6) {
      return false;
    }
    const pattern = r'^[+]*[(]?[0-9]{1,4}[)]?[-\s./0-9]*$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

bool isValidPassword(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;

  if (isRequired && (inputString == null || inputString.isEmpty)) {
    return false;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_])(?!.*\s).{8,}$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}

bool isNumeric(String? inputString, {bool isRequired = false}) {
  bool isInputStringValid = false;

  if (!isRequired && (inputString == null || inputString.isEmpty)) {
    return false;
  }

  if (inputString != null && inputString.isNotEmpty) {
    const pattern = r'^\d+$';
    final regExp = RegExp(pattern);
    isInputStringValid = regExp.hasMatch(inputString);
  }

  return isInputStringValid;
}
