import 'package:flutter/material.dart';
import 'dream_colours.dart';

var dreamTheme = ThemeData(
  useMaterial3: true,
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (BuildContext context) {
      // Custom back button app that works across the entire app
      return Container(
        decoration: BoxDecoration(
          color: DreamColours.blackGrey,
          shape: BoxShape.circle,
        ),
        child: const Padding(
          padding: EdgeInsets.all(6),
          child: Icon(
            Icons.arrow_back,
            color: DreamColours.black,
            size: 22,
          ),
        ),
      );
    },
  ),
);
