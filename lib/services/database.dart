import 'package:flutter/foundation.dart';

abstract class Database {}

class FirebaseDatabase implements Database {
  String uid;
  FirebaseDatabase({@required this.uid}) : assert(uid != null);
}
