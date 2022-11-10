import 'dart:async';
import 'package:flutter/material.dart';

import 'function.dart';

/// A class that provides a way to translate a string.
class JsonTranslation {
  /// The locale of the translation.
  Locale locale;

  JsonTranslation(this.locale);

  /// The translation object of context.
  static JsonTranslation? transCtx;

  /// The map of translations.
  static Map<dynamic, dynamic> _values = {};

  /// Initialize the translation object [JsonTranslation.init(context)].
  static void init(BuildContext context) async {
    transCtx = Localizations.of<JsonTranslation>(context, JsonTranslation);
  }

  /// Get the keys and their translations
  static Future<JsonTranslation> load(Locale locale) async {
    JsonTranslation translations = JsonTranslation(locale);

    final content = await loadString('locales/${locale.languageCode}.json');
    _values = Map<dynamic, dynamic>.from(content);

    return translations;
  }

  /// Localization delegate instance.
  static const LocalizationsDelegate<JsonTranslation> delegate =
      _JsonTranslationDelegate();

  /// Get the translation of a key.
  String translate(String key) {
    return _values[key] ?? '**$key';
  }
}

/// The localization delegate class. It is used to load the translations
/// Add this [JsonTranslation.delegate] to the `localizationDelegates` list in the `MaterialApp` widget [MaterialApp.localizationDelegates].
class _JsonTranslationDelegate extends LocalizationsDelegate<JsonTranslation> {
  const _JsonTranslationDelegate();

  /// Check if the delegate supports the locale.
  @override
  bool isSupported(Locale locale) => true;

  /// Load the translation.
  @override
  Future<JsonTranslation> load(Locale locale) => JsonTranslation.load(locale);

  @override
  bool shouldReload(_JsonTranslationDelegate old) => false;
}
