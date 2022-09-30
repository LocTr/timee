import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_api/task_api.dart';
import 'package:tasks_repo/tasks_repo.dart';
import 'package:tsks/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final tasksApi = await TaskApi.create((await Hive.initFlutter('box')));

  final tasksRepo = TasksRepo(taskApi: tasksApi);

  runApp(App(tasksRepo: tasksRepo));
}
