import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'generated/intl/messages_all.dart'; // Ensure this matches your file structure

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode?.isEmpty ?? true ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get hello => Intl.message(
        'Hello',
        name: 'hello',
        desc: 'Greet the user',
      );

  String get welcome => Intl.message(
        'Welcome to the app',
        name: 'welcome',
        desc: 'Welcome message',
      );

  String get signIn => Intl.message(
        'Sign In',
        name: 'signIn',
        desc: 'Sign In button label',
      );
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}
