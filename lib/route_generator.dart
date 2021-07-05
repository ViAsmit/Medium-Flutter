import 'package:flutter/material.dart';
import 'package:medium_flutter/src/screens/articleScreen.dart';
import 'package:medium_flutter/src/screens/editorScreen.dart';
import 'package:medium_flutter/src/screens/landingScreen.dart';
import 'package:medium_flutter/src/screens/profileScreen.dart';
import 'package:medium_flutter/src/screens/registerEmailScreen.dart';
import 'package:medium_flutter/src/screens/settingsScreen.dart';
import 'package:medium_flutter/src/screens/signEmailScreen.dart';
import 'package:medium_flutter/src/screens/signin.dart';
import 'package:medium_flutter/src/screens/signup.dart';
import 'package:medium_flutter/src/screens/welcome.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LandingScreen());
      case '/article':
        return MaterialPageRoute(builder: (_) => ArticleScreen(article: args));
      case '/signin':
        return MaterialPageRoute(builder: (_) => SigninScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case '/sign-email':
        return MaterialPageRoute(builder: (_) => SignEmailScreen());
      case '/reg-email':
        return MaterialPageRoute(builder: (_) => RegisterEmailScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfileScreen(id: args));
      case '/editor':
        return MaterialPageRoute(builder: (_) => TextEditor());
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
