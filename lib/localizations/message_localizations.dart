import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';
// flutter pub get
// flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/localizations/l10n lib/localizations/message_localizations.dart
// flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/localizations/l10n --no-use-deferred-loading lib/localizations/message_localizations.dart lib/localizations/l10n/intl_en.arb lib/localizations/l10n/intl_ja.arb

enum LanguageSupport { DEFAULT, VIETNAMESE, JAPANESE, ENGLISH }

class MessageLocalizations {
  static Future<MessageLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new MessageLocalizations();
    });
  }

  static MessageLocalizations of(BuildContext context) {
    return Localizations.of<MessageLocalizations>(
        context, MessageLocalizations);
  }

  static const LocalizationsDelegate<MessageLocalizations> delegate =
      const _MessageLocalizationsDelegate();
  static const LocalizationsDelegate<MessageLocalizations> specialDelegate =
      const _SpecificLocalizationDelegate(Locale('vi', ''));

  static LocalizationsDelegate<MessageLocalizations> getDelegateByLanguage(
      LanguageSupport lan) {
    switch (lan) {
      case LanguageSupport.VIETNAMESE:
        return const _SpecificLocalizationDelegate(Locale('vi', ''));

      case LanguageSupport.JAPANESE:
        return const _SpecificLocalizationDelegate(Locale('ja', ''));

      case LanguageSupport.ENGLISH:
        return const _SpecificLocalizationDelegate(Locale('en', ''));

      default:
        return const _MessageLocalizationsDelegate();
    }
  }

  String get title => Intl.message("Colleagues", name: 'title');

  String get anniversaryTitle =>
      Intl.message("ANNIVERSARY", name: "anniversaryTitle");

  String get yourCompanyTitle =>
      Intl.message("Your Company", name: "yourCompanyTitle");

  String get homeMenu => Intl.message("Home", name: "homeMenu");

  String get colleaguesMenu =>
      Intl.message("Colleagues", name: "colleaguesMenu");

  String get searchMenu => Intl.message("Search", name: "searchMenu");

  String get favoritesMenu => Intl.message("Favorites", name: "favoritesMenu");

  String get settingsMenu => Intl.message("Settings", name: "settingsMenu");

  String get changeBranchLabel =>
      Intl.message("Change Branch", name: "changeBranchLabel");

  String get changingLabel =>
      Intl.message("Changing...", name: "changingLabel");

  String get loadingLabel => Intl.message("Loading...", name: "loadingLabel");

  String get departmentLabel =>
      Intl.message("Departments", name: "departmentLabel");

  String get myProfileLabel =>
      Intl.message("My Profile", name: "myProfileLabel");

  String get profileLabel => Intl.message('Profile', name: 'profileLabel');

  String get accountSettingsLabel =>
      Intl.message("Account Settings", name: "accountSettingsLabel");

  String get languageSettingsLabel =>
      Intl.message("Language", name: "languageSettingsLabel");

  String get openLabel => Intl.message('OPEN', name: 'openLabel');

  String get emailLabel => Intl.message('Email', name: 'emailLabel');
  String get userNameLabel => Intl.message('User name', name: 'userNameLabel');
  String get hintUserNameMsg =>
      Intl.message('Please enter user name', name: 'hintUserNameMsg');
  String get hintEmailMsg =>
      Intl.message('Please enter email', name: 'hintEmailMsg');
  String get passwordLabel => Intl.message('Password', name: 'passwordLabel');
  String get hintPasswordMsg =>
      Intl.message('Please enter password', name: 'hintPasswordMsg');
  String get branchSelectionLabel =>
      Intl.message('Branch selection', name: 'branchSelectionLabel');
  String get memberSearchHint =>
      Intl.message('Search name, job, department, ...',
          name: 'memberSearchHint');

  String signInLabel(String suf) {
    return Intl.message('SIGN IN$suf', name: 'signInLabel', args: [suf]);
  }

  String registerLabel(String suf) {
    return Intl.message('REGISTER$suf', name: 'registerLabel', args: [suf]);
  }

  String changePassLabel(String suf) {
    return Intl.message('CHANGE PASSWORD$suf',
        name: 'changePassLabel', args: [suf]);
  }

//  String memberLabel(int number) {
//    return Intl.plural(
//        number,
//        zero: "$number member",
//        one: "$number member",
//        other: "$number members",
//        args: [number],
//        name: 'memberLabel'
//    );
//  }

  String get exitAppLabel =>
      Intl.message("Press one more to exit", name: "exitAppLabel");
}

class _MessageLocalizationsDelegate
    extends LocalizationsDelegate<MessageLocalizations> {
  const _MessageLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<MessageLocalizations> load(Locale locale) =>
      MessageLocalizations.load(locale);

  @override
  bool shouldReload(_MessageLocalizationsDelegate old) => false;
}

class _SpecificLocalizationDelegate
    extends LocalizationsDelegate<MessageLocalizations> {
  final Locale overriddenLocale;

  const _SpecificLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<MessageLocalizations> load(Locale locale) =>
      MessageLocalizations.load(overriddenLocale);

  @override
  bool shouldReload(LocalizationsDelegate<MessageLocalizations> old) => true;
}
