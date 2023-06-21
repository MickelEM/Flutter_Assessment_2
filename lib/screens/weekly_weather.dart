import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test_2/main.dart';
import 'package:test_2/models/weather.dart';
import 'package:test_2/models/weekly.dart';
import 'package:test_2/screens/detail_weather.dart';

final dio = Dio();

class WeeklyScreen extends StatefulWidget {
  const WeeklyScreen({super.key});

  @override
  State<WeeklyScreen> createState() => _WeeklyScreenState();
}

class _WeeklyScreenState extends State<WeeklyScreen> {
  final apiEndpoint = '$baseURL/forecast.json?key=$apiKey&q=$location&days=14';
  List<WeeklyForecast> _weeklyData = [];

  late Future<Response<dynamic>> _weeklyForecast;

  Future<Response<dynamic>> _weeklyForecastData() async {
    final response = await dio.get(apiEndpoint);

    for (var forecast in response.data['forecast']['forecastday']) {
      setState(() {
        _weeklyData = [
          ..._weeklyData,
          WeeklyForecast(
            date: forecast['date'],
            sunrise: forecast['astro']['sunrise'],
            sunset: forecast['astro']['sunset'],
            condition: forecast['day']['condition']['text'],
            currentDegreeInCelcius: forecast['day']['maxtemp_c'],
            currentDayData: Weather(
              country: response.data['location']['country'],
              humidity: forecast['day']['avghumidity'].toInt(),
              name: response.data['location']['name'],
              region: response.data['location']['region'],
              cloud: response.data['current']['cloud'],
              icon: response.data['current']['condition']['icon'],
              windSpeed: forecast['day']['maxwind_kph'],
              tempC: forecast['day']['maxtemp_c'],
              tempF: forecast['day']['maxtemp_f'],
              lastUpdate: response.data['current']['last_updated'],
              timezone: response.data['location']['tz_id'],
            ),
          ),
        ];
      });
    }

    return response;
  }

  @override
  void initState() {
    super.initState();

    _weeklyForecast = _weeklyForecastData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _weeklyForecast,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Error'),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: Text('...Loading'),
            ),
          );
        }

        return Scaffold(
          body: ListView.builder(
            itemCount: _weeklyData.length,
            itemBuilder: (ctx, index) => ListTile(
              onTap: () {
                Navigator.push(
                  ctx,
                  MaterialPageRoute(
                    builder: (ctx) =>
                        DetailWeather(forecastForDay: _weeklyData[index]),
                  ),
                );
              },
              title: Text(_weeklyData[index].date),
              trailing:
                  Text(_weeklyData[index].currentDegreeInCelcius.toString()),
              subtitle: Column(
                children: <Widget>[
                  Text(_weeklyData[index].sunrise),
                  Text(_weeklyData[index].sunset),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
