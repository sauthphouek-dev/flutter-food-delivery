import 'package:flutter/material.dart';

abstract class AppColors {
  // primary
  static Color primary = Color(0xFFF43F5E);
  static Color primary90 = Color(0xFFF43F5E).withOpacity(.9);
  static Color primary80 = Color(0xFFF43F5E).withOpacity(.8);
  static Color primary70 = Color(0xFFF43F5E).withOpacity(.7);
  static Color primary60 = Color(0xFFF43F5E).withOpacity(.6);
  static Color primary50 = Color(0xFFF43F5E).withOpacity(.5);
  static Color primary40 = Color(0xFFF43F5E).withOpacity(.4);
  static Color primary30 = Color(0xFFF43F5E).withOpacity(.3);
  static Color primary20 = Color(0xFFF43F5E).withOpacity(.2);
  static Color primary10 = Color(0xFFF43F5E).withOpacity(.1);
  static Color primary08 = Color(0xFFF43F5E).withOpacity(.08);
  static Color splashColor = Color(0xFFF43F5E).withOpacity(.01);

  // secondary
  static Color secondary90 = Color(0xFFFFB800).withOpacity(.9);
  static Color secondary80 = Color(0xFFFFB800).withOpacity(.8);
  static Color secondary70 = Color(0xFFFFB800).withOpacity(.7);
  static Color secondary60 = Color(0xFFFFB800).withOpacity(.6);
  static Color secondary50 = Color(0xFFFFB800).withOpacity(.5);
  static Color secondary40 = Color(0xFFFFB800).withOpacity(.4);
  static Color secondary30 = Color(0xFFFFB800).withOpacity(.3);
  static Color secondary20 = Color(0xFFFFB800).withOpacity(.2);
  static Color secondary10 = Color(0xFFFFB800).withOpacity(.1);

  // tertiary
  static Color tertiary90 = Color(0xFF1867FF).withOpacity(.9);
  static Color tertiary80 = Color(0xFF1867FF).withOpacity(.8);
  static Color tertiary70 = Color(0xFF1867FF).withOpacity(.7);
  static Color tertiary60 = Color(0xFF1867FF).withOpacity(.6);
  static Color tertiary50 = Color(0xFF1867FF).withOpacity(.5);
  static Color tertiary40 = Color(0xFF1867FF).withOpacity(.4);
  static Color tertiary30 = Color(0xFF1867FF).withOpacity(.3);
  static Color tertiary20 = Color(0xFF1867FF).withOpacity(.2);
  static Color tertiary10 = Color(0xFF1867FF).withOpacity(.1);

  // success
  static Color success90 = Color(0xFF23A757).withOpacity(.9);
  static Color success80 = Color(0xFF23A757).withOpacity(.8);
  static Color success70 = Color(0xFF23A757).withOpacity(.7);
  static Color success60 = Color(0xFF23A757).withOpacity(.6);
  static Color success50 = Color(0xFF23A757).withOpacity(.5);
  static Color success40 = Color(0xFF23A757).withOpacity(.4);
  static Color success30 = Color(0xFF23A757).withOpacity(.3);
  static Color success20 = Color(0xFF23A757).withOpacity(.2);
  static Color success10 = Color(0xFF23A757).withOpacity(.1);

  // white
  static Color white = Colors.white;

  // grey
  static Color grey50 = Colors.grey.shade50;
  static Color grey100 = Colors.grey.shade100;
  static Color grey200 = Colors.grey.shade200;
  static Color grey300 = Colors.grey.shade300;
  static Color grey400 = Colors.grey.shade400;
  static Color grey500 = Colors.grey.shade500;
  static Color grey600 = Colors.grey.shade600;
  static Color grey700 = Colors.grey.shade700;
  static Color grey800 = Colors.grey.shade800;
  static Color grey900 = Colors.grey.shade900;
}

abstract class AppDarkColors {
  static Color dark = Color(0xFF161B20).withOpacity(.9);
  static Color dark80 = Color(0xFF161B20).withOpacity(.8);
  static Color dark70 = Color(0xFF161B20).withOpacity(.7);
  static Color dark60 = Color(0xFF161B20).withOpacity(.6);
  static Color dark50 = Color(0xFF161B20).withOpacity(.5);
  static Color dark40 = Color(0xFF161B20).withOpacity(.4);
  static Color dark30 = Color(0xFF161B20).withOpacity(.3);
  static Color dark20 = Color(0xFF161B20).withOpacity(.2);
  static Color dark10 = Color(0xFF161B20).withOpacity(.1);
}

abstract class AppSpacing {
  static const double xxs = 4;
  static const double xs = 6;
  static const double s = 8;

  static const double sm = 10;
  static const double md = 12;
  static const double lg = 16;

  static const double xlg = 24;
  static const double xxlg = 32;
  static const double xxxlg = 40;
}

/// Namespace for Default App Font Weights
abstract class AppFontWeight {
  /// FontWeight value of `w900`
  static const FontWeight black = FontWeight.w900;

  /// FontWeight value of `w800`
  static const FontWeight extraBold = FontWeight.w800;

  /// FontWeight value of `w700`
  static const FontWeight bold = FontWeight.w700;

  /// FontWeight value of `w600`
  static const FontWeight semiBold = FontWeight.w600;

  /// FontWeight value of `w500`
  static const FontWeight medium = FontWeight.w500;

  /// FontWeight value of `w400`
  static const FontWeight regular = FontWeight.w400;

  /// FontWeight value of `w300`
  static const FontWeight light = FontWeight.w300;

  /// FontWeight value of `w200`
  static const FontWeight extraLight = FontWeight.w200;

  /// FontWeight value of `w100`
  static const FontWeight thin = FontWeight.w100;
}
