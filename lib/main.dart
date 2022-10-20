import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quests_api/models/enums.dart';
import 'package:quests_api/models/goal.dart';
import 'package:quests_api/models/quest.dart';
import 'package:quests_api/quests_api.dart';
import 'package:quests_repo/quests_repo.dart';
import 'package:tsks/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter('box');
  Hive
    ..registerAdapter(RepeatAdapter())
    ..registerAdapter(StatAdapter())
    ..registerAdapter(DifficultyAdapter())
    ..registerAdapter(BountyAdapter())
    ..registerAdapter(GoalAdapter())
    ..registerAdapter(QuestAdapter());
  final questsBox = await Hive.openBox<Quest>('task-box');
  final questsApi = QuestsApi(box: questsBox);

  final questsRepo = QuestsRepo(questsApi: questsApi);

  runApp(App(questsRepo: questsRepo));
}
