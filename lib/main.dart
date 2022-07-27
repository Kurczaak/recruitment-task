import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_recruitment_task/movie_app.dart';

import 'di/dependencies.dart';
import 'presentation/routing/app_route.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      //https://pub.dev/packages/easy_localization
      //flutter pub run easy_localization:generate --source-dir ./assets/translations
      //flutter pub run easy_localization:generate --source-dir ./assets/translations -f keys -o locale_keys.g.dart
      //to change language: context.setLocale(context.supportedLocales[0]);
      runApp(
        EasyLocalization(
          supportedLocales: [
            Locale('en'),
            Locale('pl'),
          ],
          path: 'assets/translations',
          fallbackLocale: Locale('en'),
          child: MovieApp(
            appRouter: AppRouter(),
          ),
        ),
      );
    },
  );
}
