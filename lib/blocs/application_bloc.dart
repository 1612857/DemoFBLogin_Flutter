import 'package:connectivity/connectivity.dart';
import 'package:flutter_widget_tot/apis/net/account_service.dart';
import 'package:flutter_widget_tot/localizations/message_localizations.dart';
import 'package:flutter_widget_tot/models/user.dart';
import 'package:flutter_widget_tot/utils/utils.dart';
import 'package:rx_command/rx_command.dart';
import 'package:rxdart/rxdart.dart';

import '../app_config.dart';
import 'bloc_provider.dart';

class ApplicationBloc implements BlocBase {
  // Data
  String myAccId;
  User me;
  String currentLocale;
  RxCommand<Map<String, String>, User> loginInCommand;

  RxCommand<void, User> getUserInfoCommand;
  RxCommand<void, bool> setupCommand;
  Observable<Exception> setupExceptionStream;

  RxCommand<void, void> networkMonitorCommand;
  RxCommand<bool, bool> networkStatusCommand;
  RxCommand<String, LanguageSupport> localeChangeCommand;


  void dispose() {

    loginInCommand.dispose();
    getUserInfoCommand.dispose();
    setupCommand.dispose();
    networkStatusCommand.dispose();
  }

  ApplicationBloc() {
    loginInCommand =
        RxCommand.createAsync<Map<String, String>, User>((request) async {
      // call api
      User user =
          await AccountService().login(request['email'], request['password']);
      return user;
    });


    Connectivity().onConnectivityChanged.listen((ConnectivityResult cnn) {
      bool online = cnn != ConnectivityResult.none;
      AppConfig.setOnlineStatus(online);
      networkStatusCommand.execute(online);
    });

  }
}
