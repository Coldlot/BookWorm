// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Network connection has been lost`
  String get networkConnection {
    return Intl.message(
      'Network connection has been lost',
      name: 'networkConnection',
      desc: '',
      args: [],
    );
  }

  /// `There is nothing yet`
  String get emptyList {
    return Intl.message(
      'There is nothing yet',
      name: 'emptyList',
      desc: '',
      args: [],
    );
  }

  /// `Go to the book list`
  String get watchBooksList {
    return Intl.message(
      'Go to the book list',
      name: 'watchBooksList',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `My Books`
  String get myBooks {
    return Intl.message(
      'My Books',
      name: 'myBooks',
      desc: '',
      args: [],
    );
  }

  /// `Library`
  String get library {
    return Intl.message(
      'Library',
      name: 'library',
      desc: '',
      args: [],
    );
  }

  /// `Sign In / Sign Out`
  String get signinout {
    return Intl.message(
      'Sign In / Sign Out',
      name: 'signinout',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signin {
    return Intl.message(
      'Sign In',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get signout {
    return Intl.message(
      'Sign Out',
      name: 'signout',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get languages {
    return Intl.message(
      'Languages',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get darkMode {
    return Intl.message(
      'Dark mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `Text size`
  String get textSize {
    return Intl.message(
      'Text size',
      name: 'textSize',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Error of reading file`
  String get errorOfFile {
    return Intl.message(
      'Error of reading file',
      name: 'errorOfFile',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Recieve code`
  String get recieveCode {
    return Intl.message(
      'Recieve code',
      name: 'recieveCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter the phone number`
  String get enterYourNumber {
    return Intl.message(
      'Enter the phone number',
      name: 'enterYourNumber',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code from SMS`
  String get enterCode {
    return Intl.message(
      'Enter the code from SMS',
      name: 'enterCode',
      desc: '',
      args: [],
    );
  }

  /// `Recieve a new one`
  String get recieveNewCode {
    return Intl.message(
      'Recieve a new one',
      name: 'recieveNewCode',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}