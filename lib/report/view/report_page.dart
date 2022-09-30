import 'package:flutter/material.dart';
import 'package:tsks/report/view/report_view.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const ReportPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const ReportView();
  }
}
