import 'package:flutter/material.dart';
import 'package:test_2/screens/tab_view.dart';

void main() {
  runApp(const MyApp());
}

const baseURL = 'http://api.weatherapi.com/v1';
const apiKey = '912902c7e29f41c2b3160541232106';
const location = '34.02139053920694,35.647088393446026';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather App',
      home: TabViewScreen(),
    );
  }
}
