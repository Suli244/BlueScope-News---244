import 'package:flutter/material.dart';

const fonst = 'Mulish';

abstract class AppTextStylesBlueScopeNews {
  static TextStyle s10Wbold({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 10,
        fontWeight: FontWeight.bold,
      );
  static TextStyle s17W600({Color? color}) => TextStyle(
        fontFamily: fonst,
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
      );
  static TextStyle s12W400({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );
  static TextStyle s14W400({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );
  static TextStyle s15W400({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      );
      static TextStyle s15W700({Color? color}) => TextStyle(
        fontFamily: fonst,
        color: color ?? Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w700,
      );
 }