import 'package:flutter/material.dart';

const Color kcPrimaryColor = Color(0xff22A45D);
const Color kcMediumGreyColor = Color(0xff868686);
const Color kcLightGreyColor = Color.fromARGB(255, 248, 248, 248);

const TextStyle ktsMediumGreyBodyText =
    TextStyle(color: kcMediumGreyColor, fontSize: kBodyTextSize);

const double kBodyTextSize = 16;
const double kBodyTextSmall = 14;

const MaterialColor primaryGreen = MaterialColor(
  _greenPrimaryValue,
  <int, Color>{
    50: Color(0xFF91d2ae),
    100: Color(0xFF7ac89e),
    200: Color(0xFF64bf8e),
    300: Color(0xFF4eb67d),
    400: Color(0xFF38ad6d),
    500: Color(_greenPrimaryValue),
    600: Color(0xFF1f9454),
    700: Color(0xFF1b834a),
    800: Color(0xFF187341),
    900: Color(0xFF146238),
  },
);
const int _greenPrimaryValue = 0xFF22A45D;
