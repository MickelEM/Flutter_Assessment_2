import 'package:flutter/material.dart';
import 'package:test_2/widgets/weather_temp.dart';
import 'package:test_2/widgets/location_card.dart';
import 'package:test_2/main.dart';
import 'package:test_2/models/weather.dart';
import 'package:dio/dio.dart';

final dio = Dio();

class DailyScreen extends StatefulWidget {
  const DailyScreen({super.key});
  @override
  State<DailyScreen> createState() => _DailyScreenState();
}

class _DailyScreenState extends State<DailyScreen> {
  final apiEndpoint = '$baseURL/current.json?key=$apiKey&q=$location&days=1';
  late Future<Response<dynamic>> _weatherFuture;
  Weather? _todaysForecast;

  Future<Response<dynamic>> _getTodayForecast() async {
    final response = await dio.get(apiEndpoint);

    setState(() {
      _todaysForecast = Weather(
        country: response.data['location']['country'],
        humidity: response.data['current']['humidity'],
        name: response.data['location']['name'],
        region: response.data['location']['region'],
        cloud: response.data['current']['cloud'],
        icon: response.data['current']['condition']['icon'],
        windSpeed: response.data['current']['wind_mph'],
        tempC: response.data['current']['temp_c'],
        tempF: response.data['current']['temp_f'],
        lastUpdate: response.data['current']['last_updated'],
        timezone: response.data['location']['tz_id'],
      );
    });

    return response;
  }

  @override
  void initState() {
    super.initState();

    _weatherFuture = _getTodayForecast();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _weatherFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Scaffold(
              body: Center(
                child: Text('An error has occured'),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: Text('Loading...')),
            );
          }

          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  'https:' + _todaysForecast!.icon,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Daily',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                WeatherTemp(
                  tempC: _todaysForecast!.tempC.toString(),
                  tempF: _todaysForecast!.tempF.toString(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    'Humidity - ${_todaysForecast!.humidity} %, Clouds - ${_todaysForecast!.cloud} %, Wind - ${_todaysForecast!.windSpeed} mph'),
                const SizedBox(
                  height: 10,
                ),
                LocationCard(
                  name: _todaysForecast!.name,
                  region: _todaysForecast!.region,
                  country: _todaysForecast!.country,
                  timezone: _todaysForecast!.timezone,
                  lastUpdate: _todaysForecast!.lastUpdate,
                ),
              ],
            ),
          );
        });
  }
}
