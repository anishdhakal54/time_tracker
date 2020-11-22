import 'package:time_tracker/app/sign_in/validators.dart';

enum EmailSignInFormType { signIn, register }

class EmailSigninModel with EmailAndPasswordValidators {
  EmailSigninModel(
      {this.email = '',
      this.password = '',
      this.formType = EmailSignInFormType.signIn,
      this.isLoading = false,
      this.isSubmitted = false});
  final String email;
  final String password;
  final EmailSignInFormType formType;
  final bool isLoading;
  final bool isSubmitted;

  String get getPrimaryText {
    return formType == EmailSignInFormType.signIn
        ? 'Sign in'
        : 'Create an account';
  }

  String get getSecondaryText {
    return formType == EmailSignInFormType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Sign in';
  }

  bool get getSubmittedEnabled {
    return emailValidator.isValid(email) &&
        passwordValidator.isValid(password) &&
        !isLoading;
  }

  bool get getPasswordShowErrorText {
    return isSubmitted && !passwordValidator.isValid(password);
  }

  bool get getEmailShowErrorText {
    return isSubmitted && !emailValidator.isValid(email);
  }

  EmailSigninModel copyWith({
    String email,
    String password,
    EmailSignInFormType formType,
    bool isLoading,
    bool isSubmitted,
  }) {
    return EmailSigninModel(
        email: email ?? this.email,
        password: password ?? this.password,
        formType: formType ?? this.formType,
        isLoading: isLoading ?? this.isLoading,
        isSubmitted: isSubmitted ?? this.isSubmitted);
  }
}
