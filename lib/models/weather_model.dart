class WeatherModel {
  final String degree;
  final String weatherDescription;
  final String weatherIcon;
  // final String timePerDay;
  final double pressure;
  final double visibility;
  final int humidity;
  final int windSpeed;
  final String windDirection;

  WeatherModel({
    required this.degree,
    required this.weatherDescription,
    required this.weatherIcon,
    // required this.timePerDay,
    required this.pressure,
    required this.visibility,
    required this.humidity,
    required this.windSpeed,
    required this.windDirection,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        degree: json["temp"],
        weatherDescription: json["weather"]["description"],
        weatherIcon: json["weather"]["icon"],
        // timePerDay: timePerDay,
        pressure: json["pressure"],
        visibility: json["visibility"],
        humidity: json["humidity"],
        windSpeed: json["wind_speed"],
        windDirection: json["wind_deg"]);
  }
}
