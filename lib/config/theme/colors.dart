import 'package:flutter/material.dart';

const accentColor = Color(0xFFFFC5DA);
const primaryColor = Color(0xFFF8BBD0);
const starsColor = Color(0xFFDBFF00);
const disabledColor = Color(0xFF9E9E9E);

const mpAppButtonColor = Color(0xFF00C853);
const mpAppBackGroundColor = Color(0xFF1A237E);
const mpAppTextColor = Color(0xFF71798C);
const mpFacebookBtnBgColor = Color(0xff3B64B6);
const mpTwitterBtnBgColor = Color(0xFF54A9E2);
const mpDrawerBackGroundColor = Color(0xFF1ECFF5);
const mpSearchBarBackGroundColor = Color(0xFF282E48);
const mpAppTextColor1 = Color(0xFF484C5A);
const mpAppCardColor = Color(0xFF191D36);
const cardBackgroundBlackDark = Color(0xFF1D2939);

// Green
const green900 = Color(0xFF1B5E20);
const green800 = Color(0xFF2E7D32);
const green700 = Color(0xFF388E3C);
const green600 = Color(0xFF43A047);
const green500 = Color(0xFF4CAF50);
const green400 = Color(0xFF66BB6A);
const green300 = Color(0xFF81C784);
const green200 = Color(0xFFA5D6A7);
const green100 = Color(0xFFC8E6C9);
const green50 = Color(0xFFE8F5E9);
const greenA100 = Color(0xFFB9F6CA);
const greenA200 = Color(0xFF69F0AE);
const greenA400 = Color(0xFF00E676);
const greenA700 = Color(0xFF00C853);

// Blue
const blue900 = Color(0xFF0D47A1);
const blue800 = Color(0xFF0277BD);
const blue700 = Color(0xFF0288D1);
const blue600 = Color(0xFF1E88E5);
const blue500 = Color(0xFF2196F3);
const blue400 = Color(0xFF42A5F5);
const blue300 = Color(0xFF64B5F6);
const blue200 = Color(0xFF90CAF9);
const blue100 = Color(0xFFBBDEFB);
const blue50 = Color(0xFFE3F2FD);
const blueA100 = Color(0xFF82B1FF);
const blueA200 = Color(0xFF448AFF);
const blueA400 = Color(0xFF2979FF);
const blueA700 = Color(0xFF2962FF);

// Purple
const purple900 = Color(0xFF4A148C);
const purple800 = Color(0xFF6A1B9A);
const purple700 = Color(0xFF7B1FA2);
const purple600 = Color(0xFF8E24AA);
const purple500 = Color(0xFF9C27B0);
const purple400 = Color(0xFFAB47BC);
const purple300 = Color(0xFFBA68C8);
const purple200 = Color(0xFFCE93D8);
const purple100 = Color(0xFFE1BEE7);
const purple50 = Color(0xFFF3E5F5);
const purpleA100 = Color(0xFFEA80FC);
const purpleA200 = Color(0xFFE040FB);
const purpleA400 = Color(0xFFD500F9);
const purpleA700 = Color(0xFFAA00FF);

Color lightScaffoldBackgroundColor = hexToColor('#EBEBEB');
const darkScaffoldBackgroundColor = Colors.transparent;
Color secondaryAppColor = hexToColor('#5E92F3');
const secondaryDarkAppColor = Colors.white;
const gold = Color(0xffFFD700);
const blue = Colors.lightBlueAccent;
const backgroundColor = Color(0xff303030);
const cardBackground = Color.fromARGB(174, 44, 44, 44);
const cardBackgroundFull = Color.fromARGB(0, 44, 44, 44);

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa');

  return Color(
    int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

/*
//
const 900 = Color(0xFF);
const 800 = Color(0xFF);
const 700 = Color(0xFF);
const 600 = Color(0xFF);
const 500 = Color(0xFF);
const 400 = Color(0xFF);
const 300 = Color(0xFF);
const 200 = Color(0xFF);
const 100 = Color(0xFF);
const 50  = Color(0xFF);
const A100 = Color(0xFF);
const A200 = Color(0xFF);
const A400 = Color(0xFF);
const A700 = Color(0xFF);*/
