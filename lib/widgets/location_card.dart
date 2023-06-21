import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
    required this.name,
    required this.region,
    required this.country,
    required this.timezone,
    required this.lastUpdate,
  });

  final String name;
  final String region;
  final String country;
  final String timezone;
  final String lastUpdate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Location:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Name: $name',
            ),
            const SizedBox(height: 8),
            Text(
              'Region: $region',
            ),
            const SizedBox(height: 8),
            Text(
              'Country: $country',
            ),
            const SizedBox(height: 8),
            Text(
              'Timezone: $timezone',
            ),
            const SizedBox(height: 8),
            Text(
              'Last Update: $lastUpdate',
            ),
          ],
        ),
      ),
    );
  }
}
