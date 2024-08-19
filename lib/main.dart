import 'package:flutter/material.dart';
import 'package:news/Home/homeScreen.dart';
import 'package:news/myThemeData.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/splashScreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     localizationsDelegates: AppLocalizations.localizationsDelegates,
     supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
     // locale: ,
     // theme:Mythemedata.lightTheme,
      initialRoute: Splashscreen.routeName,
      routes: {
         Splashscreen.routeName:(context)=> Splashscreen(),
      },
      theme:Mythemedata.LightTheme,
    );
  }
}
