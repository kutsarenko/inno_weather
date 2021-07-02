import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inno_weather/utils/colors.dart';
import 'package:inno_weather/utils/sizes.dart';

class IconSquare extends StatelessWidget {
  final String image;
  final String _indicator;
  final String measure;

  IconSquare(this.image, this._indicator, this.measure);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.04,
          width: MediaQuery.of(context).size.height * 0.04,
          decoration: BoxDecoration(
              color: backGrColor, border: Border.all(color: dividerColor)),
          child: SvgPicture.asset(
            image,
            color: iconColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(mainPadding * 0.5),
          child: Text(_indicator + measure),
        ),
      ],
    );
  }
}
