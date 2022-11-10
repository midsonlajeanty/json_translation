import 'dart:convert';
import 'package:flutter/services.dart' show  rootBundle;

Future<Map<String, dynamic>> loadString(String filePath) async {
  try{
    final content = await rootBundle.loadString(filePath);
    return json.decode(content);
  }catch(e){
    throw Exception("Unable to load asset: $filePath");
  }
}

// Future<List<String>> getSupportedLanguagesCode() async {
//   final config = await loadString('locales/config.json');
//   if(!config.keys.contains('supportedLanguagesCode')){
//     throw Exception('"supportedLanguagesCode" key is missing from config.json file');
//   }
//   final locales = config['supportedLanguagesCode'];
//   return List<String>.from(locales);
// }