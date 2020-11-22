import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:time_tracker/services/auth.dart';

class SignInBloc {
  SignInBloc({@required this.auth});
  final AuthBase auth;

  final StreamController<bool> _isloadingController = StreamController<bool>();

  Stream<bool> get isloadingController => _isloadingController.stream;

  void dispose() {
    _isloadingController.close();
  }

  void _setisLoadingState(bool isloading) {
    _isloadingController.add(isloading);
  }

  Future<User> _signIn(Future<User> Function() signinMethod) async {
    try {
      _setisLoadingState(true);
      return await signinMethod();
    } catch (e) {
      _setisLoadingState(false);
      rethrow;
    }
  }

  Future<User> signInAnonymously() async =>
      await _signIn(auth.signInAnonymously);

  Future<User> signInWithGoogle() async => await _signIn(auth.signInWithGoogle);

  Future<User> signInWithFacebook() async =>
      await _signIn(auth.signInWithFacebook);
}
