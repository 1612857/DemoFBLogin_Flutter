import 'package:flutter/material.dart';

///AppColor
const String appColor = "#4AB747";
const String appColor2 = "#70DE3C";
const String appShadowColor = "#00000030";
const String appBorderColor = "#00000005";
const String tranparent = "#00000000";
const String appText = "#1D2226";
const String appText60 = "#1D222660";
const String appWhite = "#FFFFFF";
const String appLine = "#EBEBEB";

///PrimaryColor
Color ptPrimaryColor(BuildContext context) => Theme.of(context).primaryColor;

///TextTheme
TextStyle ptDisplay4(BuildContext context) =>
    Theme.of(context).textTheme.display4;
TextStyle ptDisplay3(BuildContext context) =>
    Theme.of(context).textTheme.display3;
TextStyle ptDisplay2(BuildContext context) =>
    Theme.of(context).textTheme.display2;
TextStyle ptDisplay1(BuildContext context) =>
    Theme.of(context).textTheme.display1;
TextStyle ptHeadline(BuildContext context) =>
    Theme.of(context).textTheme.headline;
TextStyle ptTitle(BuildContext context) => Theme.of(context).textTheme.title;
TextStyle ptSubhead(BuildContext context) =>
    Theme.of(context).textTheme.subhead;
TextStyle ptBody2(BuildContext context) => Theme.of(context).textTheme.body2;
TextStyle ptBody1(BuildContext context) => Theme.of(context).textTheme.body1;
TextStyle ptCaption(BuildContext context) =>
    Theme.of(context).textTheme.caption;
TextStyle ptButton(BuildContext context) => Theme.of(context).textTheme.button;
TextStyle ptSubtitle(BuildContext context) =>
    Theme.of(context).textTheme.subtitle;
TextStyle ptOverline(BuildContext context) =>
    Theme.of(context).textTheme.overline;

///HeaderStyle
TextStyle ptHeadStyleText(BuildContext context) =>
    Theme.of(context).textTheme.headline.copyWith(fontSize: 22);

///FontStyle
class FONT {
  static const String Bold = "Barlow-Bold";
  static const String BoldItalic = "Barlow-BoldItalic";
  static const String Medium = "Barlow-Medium";
  static const String MediumItalic = "Barlow-MediumItalic";
  static const String Italic = "Barlow-Italic";
  static const String Regular = "Barlow-Regular";
  static const String SemiBold = "Barlow-SemiBold";
  static const String SemiBoldItalic = "Barlow-SemiBoldItalic";
}

///scale_utils
deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
