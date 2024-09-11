import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData darkTheme=ThemeData(

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
  ),
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: HexColor('333739'),

  // primarySwatch: Colors.deepOrange,
  appBarTheme: AppBarTheme(
    titleSpacing: 20,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor:HexColor('333739'),
    iconTheme: IconThemeData(
        color: Colors.white
    ),
    // backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      unselectedItemColor: Colors.grey,
      elevation: 20,
      backgroundColor: HexColor('333739')
  ),
  //
  textTheme: TextTheme(
    bodyText1:TextStyle(
        fontFamily: 'Acme-Recular',
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Colors.white
    ) ,
    subtitle1: TextStyle(
       // fontFamily: 'Acme-Recular',
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Colors.white,
        height: 1.3

    )
  ),
  fontFamily: 'Acme-Recular',
);
ThemeData lightTheme=ThemeData(
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: defaultColor,
  ),
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  // primarySwatch: Colors.deepOrange,
  appBarTheme: AppBarTheme(
    //fontFamily: 'Acme-Recular',

    titleSpacing: 20,
    titleTextStyle: TextStyle(
      fontFamily: 'Acme-Recular',
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
        color: Colors.black
    ),
    // backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    elevation: 0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(

      type: BottomNavigationBarType.fixed,
      selectedItemColor:defaultColor,
      unselectedItemColor: Colors.grey,
      elevation: 20,
      backgroundColor: Colors.white
  ),
  textTheme: TextTheme(
    bodyText1:TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: Colors.black
    ) ,
    subtitle1: TextStyle(
       // fontFamily: 'Acme-Recular',
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Colors.black,
        height: 1.3
    )
  ),
  fontFamily: 'Acme-Recular',

);