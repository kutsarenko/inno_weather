import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inno_weather/models/weather_model.dart';
import 'package:inno_weather/utils/colors.dart';
import 'package:inno_weather/utils/sizes.dart';

class WeatherSection extends StatelessWidget {
  final List<WeatherModel> listOfItems;
  final String dayText;
  const WeatherSection(this.listOfItems, this.dayText);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(mainPadding),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  dayText.toUpperCase(),
                  style: TextStyle(fontSize: dayTextSizes),
                ))),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: ListView.separated(
            separatorBuilder: (context, index) => Container(
              height: 1,
              color: dividerColor,
            ),
            itemCount: listOfItems.length,
            itemBuilder: (context, index) => Flexible(
              child: Container(
                  // margin: EdgeInsets.symmetric(
                  //     horizontal: mainPadding, vertical: mainPadding * 0.5),
                  // height: MediaQuery.of(context).size.height * 0.1,
                  // width: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(listOfItems[index].weatherIcon,
                      color: iconColor),
                  Center(
                    child: Column(
                      children: [
                        // Text(listOfItems[index].timePerDay),
                        Text(listOfItems[index].weatherDescription)
                      ],
                    ),
                  ),
                  Text(
                    listOfItems[index].degree + '°',
                    style: TextStyle(
                      color: degreeColor,
                      fontSize: 60,
                    ),
                  )
                ],
              )),
            ),
          ),
        )
      ],
    );
  }
}
