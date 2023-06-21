import 'package:flutter/material.dart';
import 'package:test_2/screens/daily_weather.dart';
import 'package:test_2/screens/weekly_weather.dart';

class TabViewScreen extends StatelessWidget {
  const TabViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Icon(Icons.cloud),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Daily'),
              Tab(text: 'Upcoming 2 weeks'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DailyScreen(),
            WeeklyScreen(),
          ],
        ),
      ),
    );
  }
}
