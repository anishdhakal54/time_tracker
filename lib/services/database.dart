import 'package:flutter/foundation.dart';
import 'package:time_tracker/app/home/model/job.dart';
import 'package:time_tracker/services/api_path.dart';
import 'package:time_tracker/services/firestore_service.dart';

abstract class Database {
  Future<void> createJob(Job job);

  Stream<List<Job>> getJobs();
}

class FirebaseDatabase implements Database {
  String uid;

  FirebaseDatabase({@required this.uid}) : assert(uid != null);

  final _service = FirestoreService.instance;

  Future<void> createJob(Job job) async => await _service.setData(
        path: ApiPath.job(uid, 'job_abc'),
        data: job.toMap(),
      );

  Stream<List<Job>> getJobs() => _service.collectionStream(
      path: ApiPath.jobs(uid), builder: (data) => Job.fromMap(data));
}
