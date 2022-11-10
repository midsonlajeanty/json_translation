import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

/// Load a string from a file.
Future<Map<String, dynamic>> loadString(String filePath) async {
  try {
    final content = await rootBundle.loadString(filePath);
    return json.decode(content);
  } catch (e) {
    throw Exception("Unable to load asset: $filePath");
  }
}
