import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks_api/tasks_api.dart';
import 'package:tasks_repo/tasks_repo.dart';
import 'package:tsks/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.initFlutter('box');
  final tasksApi = await TasksApi.create();
  final progressApi = await ProgressPointApi.create();

  final tasksRepo = TasksRepo(taskApi: tasksApi, progressApi: progressApi);

  runApp(App(tasksRepo: tasksRepo));
}
