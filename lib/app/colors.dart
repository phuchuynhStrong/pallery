import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xff3278e4);

class CustomGradients {
  static const oceanBlue = LinearGradient(
    colors: [
      Color(0xff2E3192),
      Color(0xff1BFFFF),
    ],
  );
  static const sanguine = LinearGradient(
    colors: [
      Color(0xffD4145A),
      Color(0xffFBB03B),
    ],
  );
  static const lusciousLime = LinearGradient(
    colors: [
      Color(0xff009245),
      Color(0xff009245),
    ],
  );
  static const kashmir = LinearGradient(
    colors: [
      Color(0xff614385),
      Color(0xff516395),
    ],
  );
  static const cleanMirror = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.5, 0.9],
    colors: [
      Color(0xff93A5CF),
      Color(0xffE4EfE9),
    ],
  );
}
