import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inno_weather/models/weather_model.dart';
import 'package:inno_weather/ui/components/appBar.dart';
import 'package:inno_weather/ui/components/weather_section.dart';
import 'package:inno_weather/utils/colors.dart';
import 'package:inno_weather/utils/sizes.dart';
import 'package:intl/intl.dart';
import 'detailed_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocode/geocode.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isDetailed = false;
  double? _latitudeCor;
  double? _longLatitudeCor;
  String _currentLocation = '';
  DateTime? _currentDate;
  String? _formatCurrentDay;

  getCurrentCoordinate() async {
    Position? position = await Geolocator.getCurrentPosition();
    setState(() {
      _latitudeCor = position.latitude;
      _longLatitudeCor = position.longitude;
    });
    print('lat - $_latitudeCor, lon - $_longLatitudeCor');
    getAddress(Coordinates());
  }

  getAddress(Coordinates coordinates) async {
    GeoCode geoCode = GeoCode();
    final coordinates = await geoCode.reverseGeocoding(
        latitude: _latitudeCor!, longitude: _longLatitudeCor!);
    setState(() {
      _currentLocation = coordinates.city.toString();
    });

    print('curLoc - $_currentLocation');
  }

  @override
  void initState() {
    _currentDate = DateTime.now();
    _formatCurrentDay = DateFormat.EEEE().format(_currentDate!);
    getCurrentCoordinate();
    super.initState();
  }

  GlobalKey _scaffoldKey = GlobalKey();

  var weatherList = <WeatherModel>[
    WeatherModel(
        degree: '22',
        weatherDescription: 'Clear',
        weatherIcon: 'assets/icons/clear.svg',
        // timePerDay: '01:00',
        humidity: 1019,
        pressure: 1.0,
        visibility: 57,
        windDirection: '',
        windSpeed: 20),
    WeatherModel(
        degree: '22',
        weatherDescription: 'Clear',
        weatherIcon: 'assets/icons/clear.svg',
        // timePerDay: '01:00',
        humidity: 1019,
        pressure: 1.0,
        visibility: 57,
        windDirection: '',
        windSpeed: 20),
    WeatherModel(
        degree: '22',
        weatherDescription: 'Clear',
        weatherIcon: 'assets/icons/clear.svg',
        // timePerDay: '01:00',
        humidity: 1019,
        pressure: 1.0,
        visibility: 57,
        windDirection: '',
        windSpeed: 20),
    WeatherModel(
        degree: '22',
        weatherDescription: 'Clear',
        weatherIcon: 'assets/icons/clear.svg',
        // timePerDay: '01:00',
        humidity: 1019,
        pressure: 1.0,
        visibility: 57,
        windDirection: '',
        windSpeed: 20),
    WeatherModel(
        degree: '22',
        weatherDescription: 'Clear',
        weatherIcon: 'assets/icons/clear.svg',
        // timePerDay: '01:00',
        humidity: 1019,
        pressure: 1.0,
        visibility: 57,
        windDirection: '',
        windSpeed: 20),
    WeatherModel(
        degree: '22',
        weatherDescription: 'Clear',
        weatherIcon: 'assets/icons/clear.svg',
        // timePerDay: '01:00',
        humidity: 1019,
        pressure: 1.0,
        visibility: 57,
        windDirection: '',
        windSpeed: 20),
    WeatherModel(
        degree: '22',
        weatherDescription: 'Clear',
        weatherIcon: 'assets/icons/clear.svg',
        // timePerDay: '01:00',
        humidity: 1019,
        pressure: 1.0,
        visibility: 57,
        windDirection: '',
        windSpeed: 20),
  ];

  @override
  Widget build(BuildContext context) {
    // DateTime _currentDate = DateTime.now();
    // var _formatCurrentDay = DateFormat.EEEE().format(_currentDate);

    List<String> _fiveDays = [
      DateFormat.EEEE().format(_currentDate!),
      DateFormat.EEEE().format(_currentDate!.add(Duration(days: 1))),
      DateFormat.EEEE().format(_currentDate!.add(Duration(days: 2))),
      DateFormat.EEEE().format(_currentDate!.add(Duration(days: 3))),
      DateFormat.EEEE().format(_currentDate!.add(Duration(days: 4)))
    ];

    return Scaffold(
        appBar:
            customAppBar(context, isDetailed, _currentLocation, _scaffoldKey),
        body: (_currentLocation == '')
            ? Center(child: CircularProgressIndicator())
            : Container(
                margin: EdgeInsets.only(bottom: mainPadding),
                // height: MediaQuery.of(context).size.height * 0.8,
                child: SingleChildScrollView(
                    child: Column(children: [
                  WeatherSection(weatherList, 'TODAY'),
                  WeatherSection(weatherList, _fiveDays[1]),
                  WeatherSection(weatherList, _fiveDays[2]),
                  WeatherSection(weatherList, _fiveDays[3]),
                  WeatherSection(weatherList, _fiveDays[4]),
                ]))));
  }
}
