import 'package:flutter/material.dart';
import 'package:time_tracker/app/home_page.dart';
import 'package:time_tracker/app/sign_in/sign_in_page.dart';
import 'package:time_tracker/services/auth.dart';

class LandingPage extends StatefulWidget {
  final AuthBase auth;
  LandingPage({@required this.auth});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    _checkUpCurrentUser();
  }

  Future<void> _checkUpCurrentUser() async {
    final user = await widget.auth.checkCurrentUser();
    _updateUser(user);
  }

  User _user;
  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        auth: widget.auth,
        signInCallBack: _updateUser,
      );
    }
    return HomePage(
      auth: widget.auth,
      signOutCallback: () => _updateUser(null),
    );
  }
}
