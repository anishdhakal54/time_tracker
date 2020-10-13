import 'package:flutter/material.dart';
import 'package:time_tracker/services/auth.dart';

class HomePage extends StatelessWidget {
  final Function signOutCallback;
  HomePage({@required this.auth, @required this.signOutCallback});
  final AuthBase auth;

  Future<void> _signoutUser() async {
    try {
      await auth.signOut();
      signOutCallback();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.local_grocery_store),
        title: Text('HomePage'),
        actions: [
          FlatButton(
            onPressed: _signoutUser,
            child: Text(
              'logout',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: Colors.white12,
          ),
        ],
      ),
    );
  }
}
