

import 'package:flutter/material.dart';
import 'package:flutter_widget_tot/apis/core/errors.dart';
import 'package:flutter_widget_tot/localizations/message_localizations.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';


class Utils {

  static bool isNotEmpty(String str) {
    return str != null && str.isNotEmpty;
  }

  static Future<Null> open(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String parseLoginError(BuildContext context, ErrorType e) {
    switch(e) {
      case ErrorType.AUTH_FAIL:
        return 'Wrong username/password. Please try again';
      case ErrorType.NETWORK_ERROR:
        return 'Lost connect to internet. Please check your conection';
      default:
        return 'System error';
    }
  }

  static String parseBusinessError(BuildContext context, ErrorType e) {
    switch(e) {
      case ErrorType.WRONG_CURRENT_PASSWORD:
        return 'Invalid current password';
      case ErrorType.AUTH_FAIL:
        return 'Sesstion timeout. Please login again';
      case ErrorType.NETWORK_ERROR:
        return 'Lost connect to internet. Please check your conection';
      default:
        return 'System error! Please try later';
    }
  }

  // static void handleBusinessException(BuildContext context, NetServiceError ex) {
  //   showAlertDialog(context, Utils.parseBusinessError(context, ex.type), confirmTap: () {
  //     Navigator.pop(context);
  //     if (ex.type == ErrorType.AUTH_FAIL) {
  //       // Routing().navigate2(context, LoginPage(), replace: true);
  //     }
  //   });
  // }

  static Color uniqueColorFromString(String text) {
    int hash = text.hashCode;
    return new Color.fromARGB(255, hash % 255, (hash * 0.5).round() % 255, (hash * 0.3).round() % 255);
  }

  static LanguageSupport codeToLanguage(String code) {
    switch(code) {
      case 'vi':
        return LanguageSupport.VIETNAMESE;

      case 'en':
        return LanguageSupport.ENGLISH;

      case 'ja':
        return LanguageSupport.JAPANESE;

      default:
        return LanguageSupport.DEFAULT;

    }
  }

  static String formatFullDay(DateTime date, String format) {
    int day = date.weekday;
    String dayInText;
    switch (day) {
      case 0:
        dayInText = 'Sunday';
        break;
      case 1:
        dayInText = 'Monday';
        break;
      case 2:
        dayInText = 'Tuesday';
        break;
      case 3:
        dayInText = 'Wednesday';
        break;
      case 4:
        dayInText = 'Thursday';
        break;
      case 5:
        dayInText = 'Friday';
        break;
      case 6:
        dayInText = 'Satuday';
        break;
      default:
        dayInText = 'ZZZ';
    }
    return '$dayInText, ${DateFormat(format).format(date)}';
  }
}