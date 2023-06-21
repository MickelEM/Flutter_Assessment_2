import 'package:flutter/material.dart';

class WeatherTemp extends StatefulWidget {
  const WeatherTemp({super.key, required this.tempC, required this.tempF});

  final String tempC;
  final String tempF;

  @override
  State<WeatherTemp> createState() => _WeatherTempState();
}

class _WeatherTempState extends State<WeatherTemp> {
  String selectedOption = widget.tempC;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.tempC,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 6,
        ),
        DropdownButton<String>(
          value: selectedOption,
          onChanged: (String value) {
            setState(() {
              selectedOption = value;
            });
          },
          items: const <DropdownMenuItem<String>>[
            DropdownMenuItem<String>(
              value: 'C',
              child: Text('C'),
            ),
            DropdownMenuItem<String>(
              value: 'F',
              child: Text('F'),
            ),
          ],
        ),
      ],
    );
  }
}
