JSON translations package for Flutter applications.

## Features

- Use JSON file to translate your application


## Getting started

```
flutter pub add json_translation
```

## Usage

See [example](example).

### Add a JSON file per language

Add a JSON file per language you support in the locales `path` and describe it in your `pubspec.yaml`

##### The locale path must be `./locales`

```yaml
flutter:
  assets:
    - locales/
```
Use one JSON file/object per language to represent the key:`String`/value:`String` pairs for the localization of your application.

##### Exemple project tree

The JSON file name must match exactly with a language code described in `supportedLocales`.

```bash
lib/
locales/
    en.json
    fr.json
```

##### Example JSON file

```jsonc
// en.json
{
	"hello-world": "Hello World."
}

// fr.json
{
	"hello-world": "Bonjour à tous."
}
```

##### Exemple `MaterialApp`

Add `JsonTranslation.delegate` in the `localizationsDelegates` of your `MaterialApp`

```dart
MaterialApp(
    localizationsDelegates: const [
        JsonTranslation.delegate,
        ...GlobalMaterialLocalizations.delegates,
    ],
    supportedLocales: const [
        Locale('en'),
        Locale('fr'),
    ],
);
```

##### Exemple

Use the `$()` function translate keywords

```dart
import 'package:json_translation/json_translation.dart';

Container(
    child: Text($("hello-world"))
)
```

## Contributing

You have a lot of options to contribute to this project ! You can :

- [Fork](https://github.com/midsonlajeanty/json_translation) on Github
- [Submit](https://github.com/midsonlajeanty/json_translation/issues) a bug report.
- [Donate](https://www.buymeacoffee.com/louismidson) to the Developper