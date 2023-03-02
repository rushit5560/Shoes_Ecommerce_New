import 'package:ecommerce_shoes_app/constants/messaging.dart';

class FieldValidator {
  String? validateFirstName(String value) {
    final validCharacters = RegExp(AppMessages.nameregx);

    if (value.isEmpty) {
      return AppMessages.firstNameIsRequired;
    } else if (!validCharacters.hasMatch(value)) {
      return AppMessages.invalidFirstName;
    }
    return null;
  }

  String? validateUserName(String value) {
    final validCharacters = RegExp(AppMessages.nameregx);
    if (value.isEmpty) {
      return AppMessages.userNamwIsRequired;
    } else if (!validCharacters.hasMatch(value)) {
      return AppMessages.invalidUserName;
    }
    return null;
  }

  String? validateLastName(String value) {
    final validCharacters = RegExp(AppMessages.nameregx);

    if (value.isEmpty) {
      return AppMessages.lastNameIsRequired;
    } else if (!validCharacters.hasMatch(value)) {
      return "Invalid last name";
    }
    return null;
  }

  String? validateCompanyName(String value) {
    final validCharacters = RegExp(AppMessages.nameregx);
    if (value.isEmpty) {
      return AppMessages.companyNameIsRequired;
    } else if (!validCharacters.hasMatch(value)) {
      return AppMessages.invalidCompanyName;
    }
    return null;
  }

  String? validateOrderNote(String value) {
    if (value.isEmpty) {
      return AppMessages.orderNoteIsRequired;
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return AppMessages.addressIsRequired;
    }
    return null;
  }

  String? validateCity(String value) {
    final validCharacters = RegExp(AppMessages.nameregx);
    if (value.isEmpty) {
      return AppMessages.cityIsRequired;
    } else if (!validCharacters.hasMatch(value)) {
      return AppMessages.invalidCityName;
    }
    return null;
  }

  String? validateState(String value) {
    final validCharacters = RegExp(AppMessages.nameregx);
    if (value.isEmpty) {
      return AppMessages.stateIsRequired;
    } else if (!validCharacters.hasMatch(value)) {
      return AppMessages.invalidstateName;
    }
    return null;
  }

  String? validateFullName(String value) {
    final validCharacters = RegExp(AppMessages.nameregx);
    if (value.isEmpty) {
      return AppMessages.fullNameIsRequired;
    } else if (!validCharacters.hasMatch(value)) {
      return AppMessages.invalidfuLLName;
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return AppMessages.emailIsRequired;
    } else if (!isNumeric(value) &&
        !RegExp(AppMessages.mailRegx).hasMatch(value)) {
      return AppMessages.invalidMail;
    } else {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return AppMessages.passwordIsRequired;
    } else if (value.length < 6) {
      return AppMessages.lengthsShouldBeSixCha;
    } else {
      return null;
    }
  }

  String? validateMobile(String value) {
    if (value.isEmpty) {
      return AppMessages.mobileNumberIsRequired;
    } else if (value.length != 10) {
      return AppMessages.mobileNumberMustBeOfTenDegit;
    } else if (value.contains("-")) {
      return AppMessages.invalidMobilNumber;
    } else {
      return null;
    }
  }

  bool isNumeric(String s) {
    if (s.isEmpty) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  String? validateSubject(String value) {
    if (value.isEmpty) {
      return AppMessages.subjectIsRequired;
    } else if (!RegExp(AppMessages.regx).hasMatch(value)) {
      return AppMessages.invalidSubjectName;
    }
    return null;
  }

  String? validateComment(String value) {
    if (value.isEmpty) {
      return AppMessages.commentIsRequired;
    } else if (!RegExp(AppMessages.regx).hasMatch(value)) {
      return AppMessages.invalidComment;
    }
    return null;
  }

  String? validateProductReview(String value) {
    if (value.isEmpty) {
      return AppMessages.reviewIsRequired;
    }
    return null;
  }

  String? validateShippingAddress(String value) {
    if (value.isEmpty) {
      return AppMessages.shippingAddressShouldNotBeEmpty;
    }
    return null;
  }

  String? validateBillingAddress(String value) {
    if (value.isEmpty) {
      return AppMessages.billingAddressShouldNotBeEmpty;
    }
    return null;
  }
}
