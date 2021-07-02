import 'package:flutter/material.dart';
import 'package:inno_weather/utils/colors.dart';

PreferredSizeWidget customAppBar(
    BuildContext context, bool isDetailed, String title, dynamic scaffoldKey) {
  return PreferredSize(
    preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.08),
    child: SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              isDetailed == true
                  ? GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back),
                    )
                  : Container(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.07,
                child: Align(
                    child: Text(
                  title,
                  style: TextStyle(
                      color: appBarTextColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ],
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: dividerColor,
          ),
        ],
      ),
    ),
  );
}
