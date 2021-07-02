import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inno_weather/models/weather_model.dart';
import 'package:inno_weather/ui/components/appBar.dart';
import 'package:inno_weather/ui/components/icon_square.dart';
import 'package:inno_weather/utils/colors.dart';
import 'package:inno_weather/utils/sizes.dart';

class DetailedScreen extends StatelessWidget {
  bool isDetailed = true;
  String title = 'Today';
  GlobalKey _scaffoldKey = GlobalKey();
  String _currentLocation = 'Gomel';
  String _country = 'by';
  WeatherModel _detailedWeather = WeatherModel(
      degree: '22',
      weatherDescription: 'Clear',
      weatherIcon: 'assets/icons/clear.svg',
      // timePerDay: '13:00',
      humidity: 1019,
      pressure: 1.0,
      visibility: 57,
      windDirection: 'SE',
      windSpeed: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, isDetailed, title, _scaffoldKey),
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  child: SvgPicture.asset(
                _detailedWeather.weatherIcon,
                width: 180,
                height: 180,
                color: iconColor,
              )),
              Text(
                '$_currentLocation, ${_country.toUpperCase()}',
                style: TextStyle(color: appBarTextColor, fontSize: 20),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                  '${_detailedWeather.degree} ° | ${_detailedWeather.weatherDescription}',
                  style: TextStyle(color: degreeColor, fontSize: 20)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              Container(
                  margin: EdgeInsets.symmetric(vertical: mainPadding),
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.4,
                  color: constantLisvView),
              Container(
                margin: const EdgeInsets.all(mainPadding * 1.1),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconSquare('assets/icons/weather_icons-19.svg',
                          _detailedWeather.pressure.toString(), '%'),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                      IconSquare('assets/icons/weather_icons-14.svg',
                          _detailedWeather.visibility.toString(), ' mm'),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                      IconSquare('assets/icons/weather_icons-35.svg',
                          _detailedWeather.humidity.toString(), ' hPa'),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(mainPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconSquare('assets/icons/weather_icons-61.svg',
                          _detailedWeather.windSpeed.toString(), ' km/h'),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                      IconSquare('assets/icons/weather_icons-66.svg',
                          _detailedWeather.windDirection, ''),
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(vertical: mainPadding),
                  height: 1,
                  width: MediaQuery.of(context).size.width * 0.4,
                  color: constantLisvView),
              GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(mainPadding),
                  child: Text(
                    'Share',
                    style: TextStyle(color: Colors.orange, fontSize: 25),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
