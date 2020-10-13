import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class User {
  final String uid;
  User({@required this.uid});
}

abstract class AuthBase {
  Future<User> checkCurrentUser();
  Future<User> signInAnynomously();
  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseauth = FirebaseAuth.instance;

  User _userFromFirebase(User user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid);
  }

  @override
  Future<User> checkCurrentUser() async {
    final user = _firebaseauth.currentUser;
    return _userFromFirebase(User(uid: user.uid));
  }

  @override
  Future<User> signInAnynomously() async {
    final userCredential = await _firebaseauth.signInAnonymously();
    final user = userCredential.user;
    return _userFromFirebase(User(uid: user.uid));
  }

  @override
  Future<void> signOut() async {
    await _firebaseauth.signOut();
  }
}
