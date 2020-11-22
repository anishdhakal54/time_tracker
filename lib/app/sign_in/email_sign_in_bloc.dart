import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:time_tracker/app/sign_in/email_sign_in_model.dart';
import 'package:time_tracker/services/auth.dart';

class EmailSignInBloc {
  EmailSignInBloc({@required this.auth});
  final AuthBase auth;
  final StreamController<EmailSigninModel> _modelController =
      StreamController<EmailSigninModel>();

  Stream<EmailSigninModel> get modelController => _modelController.stream;
  EmailSigninModel _model = EmailSigninModel();

  void dispose() {
    _modelController.close();
  }

  Future<void> submit() async {
    updateWith(isLoading: true, isSubmitted: true);
    try {
      if (_model.formType == EmailSignInFormType.signIn) {
        await auth.signInWithEmailAndPassword(_model.email, _model.password);
      } else {
        await auth.createUserWithEmailAndPassword(
            _model.email, _model.password);
      }
    } catch (e) {
      rethrow;
      // print(e.toString());
    } finally {
      updateWith(isLoading: false);
    }
  }

  void updateWith(
      {String email,
      String password,
      bool isLoading,
      bool isSubmitted,
      EmailSignInFormType formType}) {
    _model = _model.copyWith(
        email: email,
        password: password,
        isLoading: isLoading,
        isSubmitted: isSubmitted,
        formType: formType);
    _modelController.add(_model);
  }
}
