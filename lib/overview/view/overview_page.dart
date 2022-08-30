import 'package:flutter/material.dart';

import '../widgets/task_entry.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Text('Today tasks',
                      style: TextStyle(
                        fontSize: 24,
                      )),
                  TaskEntry(),
                  SizedBox(
                    height: 12,
                  ),
                  TaskEntry(),
                ],
              ))),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.pie_chart_outline)),
            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          ],
        ),
      ),
    );
  }
}
