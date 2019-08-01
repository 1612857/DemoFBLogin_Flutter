import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_tot/blocs/application_bloc.dart';
import 'package:flutter_widget_tot/blocs/bloc_provider.dart';
import 'package:flutter_widget_tot/ui/customs/safe_page.dart';

class DefaultPage extends StatefulWidget {
  DefaultPage();

  @override
  State<StatefulWidget> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> with WidgetsBindingObserver {
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
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Text('Login Page')
      ),
    );
  }
}
