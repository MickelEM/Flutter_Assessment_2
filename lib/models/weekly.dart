import 'package:test_2/models/weather.dart';

class WeeklyForecast {
  const WeeklyForecast({
    required this.date,
    required this.sunrise,
    required this.sunset,
    required this.condition,
    required this.currentDegreeInCelcius,
    required this.currentDayData,
  });

  final String sunrise;
  final String sunset;
  final String date;
  final String condition; // sunny rainy...
  final double currentDegreeInCelcius;
  final Weather currentDayData;
}
