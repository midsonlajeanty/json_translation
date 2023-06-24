import 'package:flutter/material.dart';
import 'package:ht_localization/ht_localization.dart';
import 'package:json_translation/json_translation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(locale);
  }
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Locale _locale = const Locale.fromSubtags(languageCode: 'ht');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JSON Translation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'JSON Translation Demo'),
      localizationsDelegates: const [
        JsonTranslation.delegate,
        ...HTLocalizations.delegates,
        ...GlobalMaterialLocalizations.delegates,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
        Locale('ht'),
      ],
      locale: _locale,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {

    // Iinitialize the package with context 
    JsonTranslation.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 
            Text($("hello-world")),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
          String lang;
          switch (index) {
            case 0:
              lang = 'en';
              break;
            case 1:
              lang = 'fr';
              break;
            case 2:
              lang = 'ht';
              break;
            default:
              lang = 'ht';
          }
          MyApp.setLocale(context, Locale.fromSubtags(languageCode: lang));
        },
        items: const [
          BottomNavigationBarItem(
            icon: Text("EN"),
            label: 'English',
          ),
          BottomNavigationBarItem(
            icon: Text("FR"),
            label: 'Français',
          ),
          BottomNavigationBarItem(
            icon: Text("HT"),
            label: 'Ayisyen',
          ),
        ],
      ),
    );
  }
}
