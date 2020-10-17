abstract class StringValidator {
  bool isValid(String value);
}

class NonEmpltyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class EmailAndPasswordValidator {
  final StringValidator emailValidator = NonEmpltyStringValidator();
  final StringValidator passwordValidator = NonEmpltyStringValidator();
  final String inValidPasswordErrorText = 'Password cannot be empty';
  final String inValidEmailErrorText = 'Email cannot be empty';
}
