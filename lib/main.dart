
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_tot/ui/pages/login_page.dart';
import 'package:flutter_widget_tot/utils/constants.dart';
import 'package:flutter_widget_tot/utils/hex_color.dart';
import 'package:sentry/sentry.dart';

import 'blocs/application_bloc.dart';
import 'blocs/bloc_provider.dart';

final SentryClient _sentry = new SentryClient(dsn: "PLEASE ENTER DSN SENTRY TOKEN HERE");

// PLEASE REFER LIB BELLOW FOR REMOTE MONITOR LOGCAT
//*** https://pub.dartlang.org/packages/appspector ***

void main() async {
  runApp(SampleApp());
}

class SampleApp extends StatefulWidget {
  SampleApp();

  @override
  State<StatefulWidget> createState() {
    return SampleAppState();
  }
}

typedef void LocaleChangeCallback(Locale locale);

class SampleAppState extends State<SampleApp> with WidgetsBindingObserver {
  ApplicationBloc _appBloc;

  @override
  void initState() {
    // start point create ApplicationBloc
    _appBloc = ApplicationBloc();

    // set ImageCache size
    PaintingBinding.instance.imageCache.maximumSizeBytes = 10485760 * 20; // 200M

    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApplicationBloc>(
      bloc: _appBloc,
      child: MaterialApp(
        theme: _theme(),
        title: 'Widget', // MessageLocalizations.of(context).title,
        home: LoginPage(),
      ),
    );
  }

  ThemeData _theme() {
    return Theme.of(context).copyWith(
      primaryIconTheme: IconThemeData(color: HexColor(appText)),
      // Define the default Brightness and Colors
      brightness: Brightness.light,
      primaryColor: HexColor(appColor),
      accentColor: HexColor(appWhite),

      inputDecorationTheme: InputDecorationTheme(
        labelStyle: Theme.of(context).textTheme.subtitle,
        fillColor: HexColor(appColor),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: HexColor(appColor))),
      ),

      /// Define the default buttonTheme. Use this to specify the default
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            buttonColor: HexColor(appColor),
            textTheme: ButtonTextTheme.accent,
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          ),

      /// Define the default TextTheme. Use this to specify the default
      /// text styling for headlines, titles, bodies of text, and more.
      textTheme: Theme.of(context).textTheme.copyWith(
            headline: TextStyle(
              fontFamily: FONT.Bold,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: HexColor(appText),
            ),
            subhead: TextStyle(
              fontFamily: FONT.Regular,
              fontSize: 25.0,
              color: HexColor(appText),
            ),
            title: TextStyle(
              fontFamily: FONT.SemiBold,
              fontSize: 18.0,
              color: HexColor(appText),
            ),
            subtitle: TextStyle(
              fontFamily: FONT.Regular,
              fontSize: 15.0,
              color: HexColor(appText60),
            ),
            body1: TextStyle(
              fontFamily: FONT.Regular,
              fontSize: 14.0,
              color: HexColor(appText),
            ),
            body2: TextStyle(
              fontFamily: FONT.Regular,
              fontSize: 14.0,
              height: 1.2,
              color: HexColor(appText60),
            ),
            caption: TextStyle(
              fontFamily: FONT.Regular,
              fontSize: 11.0,
              color: HexColor(appText60),
            ),
            button: TextStyle(
              fontFamily: FONT.Medium,
              fontWeight: FontWeight.bold,
              fontSize: 15.0,
              color: HexColor(appWhite),
            ),
            overline: TextStyle(
              fontFamily: FONT.Regular,
              fontSize: 10.0,
              color: HexColor(appText),
            ),
          ),
    );
  }
}
