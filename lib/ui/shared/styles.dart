import 'package:flutter/material.dart';

const Color kcPrimaryColor = Color(0xff22A45D);
const Color kcMediumGreyColor = Color(0xff868686);
const Color kcLightGreyColor = Color.fromARGB(255, 243, 243, 243);
const Color kcInputFillColor = Color.fromARGB(255, 248, 248, 248);

const Color kcRedColor = Color(0xfff44336);
const Color kcOrangeColor = Color(0xffff9800);

const TextStyle ktsMediumGreyBodyText =
    TextStyle(color: kcMediumGreyColor, fontSize: kBodyTextNormal);

const double kBodyTextSmall1 = 14;
const double kBodyTextSmall2 = 15;
const double kBodyTextCaption = 12;
const double kBodyTextNormal = 16;
const double kBodyTextLarge1 = 18;
const double kBodyTextLarge2 = 19;
const double kH4Title = 22;
const double kH3Title = 24;
const double kH2Title = 28;
const double kH1Title = 34;
const double kHeadline = 30;

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
