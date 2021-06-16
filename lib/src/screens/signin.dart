import 'package:flutter/material.dart';
import 'package:medium_flutter/config/app_config.dart' as device;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medium_flutter/src/widgets/loginMethodsButton.dart';

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  // @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 70.0),
            Image.asset(
              'assets/images/logo.png',
              height: 50,
              width: device.App(context).appWidth(100),
              // alignment: ,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 50.0),
            Text('Welcome Back',
                style: Theme.of(context)
                    .textTheme
                    .display4
                    .merge(TextStyle(fontSize: 50.0))),
            SizedBox(height: 20.0),
            LoginMethodsButton(
              () {
                print('yyy');
              },
              type: "Sign in with Google",
              icon: FontAwesomeIcons.google,
            ),
            LoginMethodsButton(
              () {
                print('yyy');
              },
              type: "Sign in with Facebook",
              icon: FontAwesomeIcons.facebookF,
            ),
            LoginMethodsButton(
              () {
                Navigator.of(context).pushNamed('/sign-email');
              },
              type: "Sign in with Email",
              icon: FontAwesomeIcons.envelope,
            ),
            SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/signup');
              },
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.body1,
                  children: [
                    TextSpan(text: "Don't have an account? "),
                    TextSpan(
                      text: "Sign up.",
                      style: TextStyle(color: Colors.green),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
