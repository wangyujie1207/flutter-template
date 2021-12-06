import 'package:flutter/material.dart';

class Themes {
  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: const Color(0xff667DF6),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: const Color(0xffF9F8FD),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.grey[200]),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      )
    )
  );

  static final darkTheme = ThemeData.dark().copyWith(
      primaryColor: const Color(0xff667DF6),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: const Color(0xff20232C),
      popupMenuTheme: PopupMenuThemeData(
        color: const Color(0xff2B2C31).withOpacity(0.9),
      )
  );
}