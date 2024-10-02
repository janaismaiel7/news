
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:news/Home/news/newsDetails.dart';
import 'package:news/Providers/appConfigProvider.dart';
import 'package:news/di/di.dart';
import 'package:provider/provider.dart';
import 'package:news/myThemeData.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news/myblocObserver.dart';
import 'package:news/splashScreen.dart';
import 'package:path_provider/path_provider.dart';

void main()  {
  // WidgetsFlutterBinding.ensureInitialized();
  //  Bloc.observer = MyBlocObserver();
  //  final documentDirectory = await getApplicationDocumentsDirectory();
  //  Hive.init(documentDirectory.path);
  //   ChangeNotifierProvider(
  runApp(
     ChangeNotifierProvider(
      create: (_) => Appconfigprovider(),
      child: MyApp(),
     )
  );
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
        Splashscreen.routeName: (context) => Splashscreen(),
        Newsdetails.routeName:(context)=>Newsdetails()
      },
      theme: Mythemedata.LightTheme,
      
      
    );
  }
}
