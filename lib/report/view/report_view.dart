import 'package:flutter/material.dart';
import 'package:tsks/report/widgets/chart/linechart.dart';
import 'package:tsks/shared_widget/header.dart';

class ReportView extends StatelessWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const ScreenHeader(
                title: 'Report',
              ),
              const SizedBox(height: 24),
              LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  // double width = constraints.maxWidth;
                  return const LineChartSample1();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
