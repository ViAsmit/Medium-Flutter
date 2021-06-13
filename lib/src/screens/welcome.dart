import 'package:flutter/material.dart';

class WelcomeScreem extends StatefulWidget {
  @override
  _WelcomeScreemState createState() => _WelcomeScreemState();
}

class _WelcomeScreemState extends State<WelcomeScreem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Text(
            'Welcome',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
