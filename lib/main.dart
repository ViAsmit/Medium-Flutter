import 'package:medium_flutter/config/app_config.dart' as config;
import 'package:medium_flutter/provider/getit.dart';
import 'package:medium_flutter/route_generator.dart';
import 'package:medium_flutter/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:medium_flutter/services/prefs_services.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  String token = await Prefs().getAuthToken();
  print("=====");
  print(token);
  print("=====");
  await Prefs().getAuthToken();
  await Prefs().getAuthUID();
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String token;
  MyApp({this.token = ""});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigationService>().navigatorKey,
      title: 'Medium Flutter UI',
      initialRoute: (token == "") ? '/signin' : "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        fontFamily: 'Poppins',
        backgroundColor: Colors.black,
        primaryColor: Colors.white,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF2C2C2C),
        accentColor: config.Colors().mainDarkColor(1),
        hintColor: config.Colors().secondDarkColor(1),
        focusColor: config.Colors().accentDarkColor(1),
        textTheme: TextTheme(
          button: TextStyle(color: Color(0xFF252525)),
          headline: TextStyle(
              fontSize: 20.0, color: config.Colors().secondDarkColor(1)),
          display1: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: config.Colors().secondDarkColor(1)),
          display2: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: config.Colors().secondDarkColor(1)),
          display3: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
              color: config.Colors().mainDarkColor(1)),
          display4: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w300,
              color: config.Colors().secondDarkColor(1)),
          subhead: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              color: config.Colors().secondDarkColor(1)),
          title: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: config.Colors().mainDarkColor(1)),
          body1: TextStyle(
              fontSize: 12.0, color: config.Colors().secondDarkColor(1)),
          body2: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: config.Colors().secondDarkColor(1)),
          caption: TextStyle(
              fontSize: 12.0, color: config.Colors().secondDarkColor(0.7)),
        ),
      ),
      theme: ThemeData(
        fontFamily: 'Poppins',
        backgroundColor: Colors.white,
        primaryColor: Colors.black,
        brightness: Brightness.light,
        accentColor: config.Colors().mainColor(1),
        focusColor: config.Colors().accentColor(1),
        hintColor: config.Colors().secondColor(1),
        textTheme: TextTheme(
          button: TextStyle(color: Colors.white),
          headline:
              TextStyle(fontSize: 20.0, color: config.Colors().secondColor(1)),
          display1: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: config.Colors().secondColor(1)),
          display2: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: config.Colors().secondColor(1)),
          display3: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
              color: config.Colors().mainColor(1)),
          display4: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w300,
              color: config.Colors().secondColor(1)),
          subhead: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              color: config.Colors().secondColor(1)),
          title: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: config.Colors().mainColor(1)),
          body1:
              TextStyle(fontSize: 12.0, color: config.Colors().secondColor(1)),
          body2: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: config.Colors().secondColor(1)),
          caption: TextStyle(
              fontSize: 12.0, color: config.Colors().secondColor(0.8)),
        ),
      ),
    );
  }
}
