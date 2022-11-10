import 'dart:async';
import 'package:flutter/material.dart';

import 'function.dart';

class JsonTranslation {
  Locale locale;
  JsonTranslation(this.locale);

  static JsonTranslation? transCtx;
  
  static Map<dynamic, dynamic> _values = {};

  static void init(BuildContext context) async{
    transCtx = Localizations.of<JsonTranslation>(context, JsonTranslation);
  }

  static Future<JsonTranslation> load(Locale locale) async {
    JsonTranslation translations = JsonTranslation(locale);

    final content = await loadString('locales/${locale.languageCode}.json');
    _values = Map<dynamic, dynamic>.from(content);

    return translations;
  }

  static const LocalizationsDelegate<JsonTranslation> delegate = _JsonTranslationDelegate();

  String translate(String key) {
    return _values[key] ?? '**$key';
  }
}

class _JsonTranslationDelegate extends LocalizationsDelegate<JsonTranslation> {
  const _JsonTranslationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr', 'ht'].contains(locale.languageCode);

  @override
  Future<JsonTranslation> load(Locale locale) => JsonTranslation.load(locale);

  @override
  bool shouldReload(_JsonTranslationDelegate old) => false;
}