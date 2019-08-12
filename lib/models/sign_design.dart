import 'package:flutter/material.dart';

class SignInOrSignUpDesign {
  static List<Color> loginTopBackground(bool isJoin) {
    return isJoin
        ? [
            Colors.red,
            Colors.redAccent,
          ]
        : [
            Colors.blue,
            Colors.blueAccent,
          ];
  }
}
