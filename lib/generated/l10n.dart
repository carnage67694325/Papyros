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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Papyrus`
  String get logo {
    return Intl.message(
      'Papyrus',
      name: 'logo',
      desc: '',
      args: [],
    );
  }

  /// `Getting Started`
  String get gettingStarted {
    return Intl.message(
      'Getting Started',
      name: 'gettingStarted',
      desc: '',
      args: [],
    );
  }

  /// `Create your account to start your journey`
  String get createAccount {
    return Intl.message(
      'Create your account to start your journey',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `first name`
  String get firstName {
    return Intl.message(
      'first name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `last name`
  String get lastName {
    return Intl.message(
      'last name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Your Email`
  String get yourEmail {
    return Intl.message(
      'Your Email',
      name: 'yourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Your Password`
  String get yourPassword {
    return Intl.message(
      'Your Password',
      name: 'yourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree our`
  String get agreement {
    return Intl.message(
      'By creating an account, you agree our',
      name: 'agreement',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get conditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'conditions',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Have an account already?`
  String get haveAccount {
    return Intl.message(
      'Have an account already?',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIN {
    return Intl.message(
      'Sign in',
      name: 'signIN',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUP {
    return Intl.message(
      'Sign Up',
      name: 'signUP',
      desc: '',
      args: [],
    );
  }

  /// `Continue your journey with us`
  String get continueYourJourny {
    return Intl.message(
      'Continue your journey with us',
      name: 'continueYourJourny',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password?`
  String get forgotPass {
    return Intl.message(
      'Forget Password?',
      name: 'forgotPass',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message(
      'Remember me',
      name: 'rememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don’t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message(
      'Get Started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `phone`
  String get phone {
    return Intl.message(
      'phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `OTP`
  String get OTP {
    return Intl.message(
      'OTP',
      name: 'OTP',
      desc: '',
      args: [],
    );
  }

  /// `send OTP`
  String get sendOTP {
    return Intl.message(
      'send OTP',
      name: 'sendOTP',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get editProfile {
    return Intl.message(
      'Edit profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Bio`
  String get bio {
    return Intl.message(
      'Bio',
      name: 'bio',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Birth date `
  String get birthDate {
    return Intl.message(
      'Birth date ',
      name: 'birthDate',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Account Settings`
  String get accountSettings {
    return Intl.message(
      'Account Settings',
      name: 'accountSettings',
      desc: '',
      args: [],
    );
  }

  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  String get chatBotGreetings {
    return Intl.message(
      'How can I help you today?',
      name: 'chatBotGreetings',
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
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
