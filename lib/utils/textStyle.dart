// ignore_for_file: file_names

import 'package:bloc_practice/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MyText {
  static heading(
      {required String text,
      Color? color = whiteColor,
      TextAlign? textAlign = TextAlign.center}) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color),
    )
        .animate(delay: 1.3.seconds)
        .then(duration: 500.ms)
        .fadeIn(begin: 0, duration: 300.ms)
        .moveY(begin: -50);
  }

  static body({required String text, Color? color = secondaryColor}) {
    return Text(
      text,
      style:
          TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: color),
    ).animate(delay: 1.3.seconds)
        .then(duration: 500.ms)
        .fadeIn(begin: 0, duration: 300.ms)
        .moveY(begin: -50);
  }
}