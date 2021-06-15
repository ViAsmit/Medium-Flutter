import 'package:flutter/material.dart';
import 'package:medium_flutter/src/screens/editorScreen.dart';
import 'package:medium_flutter/src/screens/landingScreen.dart';
import 'package:medium_flutter/src/screens/profileScreen.dart';
import 'package:medium_flutter/src/screens/signin.dart';
import 'package:medium_flutter/src/screens/signup.dart';
import 'package:medium_flutter/src/screens/welcome.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => WelcomeScreem());
      case '/signin':
        return MaterialPageRoute(builder: (_) => SigninScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => LandingScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case '/editor':
        return MaterialPageRoute(builder: (_) => EditorScreen());
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
