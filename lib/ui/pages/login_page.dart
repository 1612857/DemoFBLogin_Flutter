import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_tot/blocs/application_bloc.dart';
import 'package:flutter_widget_tot/blocs/bloc_provider.dart';
import 'package:flutter_widget_tot/ui/customs/safe_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  static const double APP_BAR_HEIGHT = 200.0;
  ApplicationBloc _appBloc;
 
  @override
  void initState() {
    _appBloc = BlocProvider.of<ApplicationBloc>(context);

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafePage(
      child: Center(
        child: Text('Login Page', style: TextStyle(color: Colors.black),)
      ),
    );
  }
}
