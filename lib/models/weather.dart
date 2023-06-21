class Weather {
  const Weather({
    required this.country,
    required this.humidity,
    required this.name,
    required this.region,
    required this.cloud,
    required this.icon,
    required this.windSpeed,
    required this.tempC,
    required this.tempF,
    required this.timezone,
    required this.lastUpdate,
  });

  final String name;
  final String region;
  final String country;

  final int humidity;
  final int cloud;
  final double windSpeed;
  final String icon;
  final double tempC;
  final double tempF;
  final String timezone;
  final String lastUpdate;
}
