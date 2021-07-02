import 'package:http/http.dart' as http;
import 'package:inno_weather/models/weather_model.dart';
import 'dart:convert';

class WeatherRepo {
  Future<WeatherModel> getWeather(String lat, String lon) async {
    final result = await http.Client().get(Uri(
        path:
            'api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=daily&appid=2944bef026a0e62f932b946713012b48'));

    if (result.statusCode != 200) {
      throw Exception('Something went wrong');
    } else {
      return parsedJson(result.body);
    }
  }

  WeatherModel parsedJson(final response) {
    final jsonDecode = json.decode(response);
    final jsonWeather = jsonDecode["hourly"];
    return jsonWeather;
  }
}
