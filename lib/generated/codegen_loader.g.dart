// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> pl = {
  "hello_world": "Cześć!",
  "budget": "Budżet",
  "revenue": "Przychód",
  "should_watch": "Czy powinienem obejrzeć?",
  "yes": "Tak",
  "no": "Nie",
  "empty_result": "Brak wyników",
  "error_text": "Coś poszło nie tak",
  "no_internet_error": "Brak Internetu. Sprawdź połączenie.",
  "search": "Szukaj..."
};
static const Map<String,dynamic> en = {
  "hello_world": "Hello!",
  "budget": "Budget",
  "revenue": "Revenue",
  "should_watch": "Should I watch it?",
  "yes": "Yes",
  "no": "No",
  "empty_result": "No results found",
  "error_text": "Something went wrong",
  "no_internet_error": "No Internet connection. Try again.",
  "search": "Search..."
};
static const Map<String, Map<String,dynamic>> mapLocales = {"pl": pl, "en": en};
}
