import 'package:flutter/material.dart';
import 'package:test_2/models/weekly.dart';
import 'package:test_2/widgets/location_card.dart';
import 'package:test_2/widgets/weather_temp.dart';

class DetailWeather extends StatelessWidget {
  const DetailWeather({
    super.key,
    required this.forecastForDay,
  });

  final WeeklyForecast forecastForDay;

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'https:' + forecastForDay.currentDayData.icon,
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
              tempC: forecastForDay.currentDayData.tempC.toString(),
              tempF: forecastForDay.currentDayData.tempF.toString(),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
                'Humidity - ${forecastForDay.currentDayData.humidity..toString()} %, Clouds - ${forecastForDay.currentDayData.cloud.toString()} %, Wind - ${forecastForDay.currentDayData.windSpeed.toString()} mph'),
            const SizedBox(
              height: 10,
            ),
            LocationCard(
              name: forecastForDay.currentDayData.name,
              region: forecastForDay.currentDayData.region,
              country: forecastForDay.currentDayData.country,
              timezone: forecastForDay.currentDayData.timezone,
              lastUpdate: forecastForDay.currentDayData.lastUpdate,
            ),
          ],
        ));
  }
}
