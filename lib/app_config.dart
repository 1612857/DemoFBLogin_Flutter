

class AppConfig {
  static bool _online;

  static bool enableSentryReporter = false;



  static void setOnlineStatus(bool online) {
    _online = online;
  }
  static get isOnLine => _online;

}