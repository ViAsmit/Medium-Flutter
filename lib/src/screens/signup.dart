import 'package:flutter/material.dart';
import 'package:medium_flutter/config/app_config.dart' as device;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medium_flutter/src/widgets/loginMethodsButton.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
            Text('Join Medium',
                style: Theme.of(context)
                    .textTheme
                    .display4
                    .merge(TextStyle(fontSize: 50.0))),
            SizedBox(height: 20.0),
            LoginMethodsButton(
              () {
                print('yyy');
              },
              type: "Sign up with Google",
              icon: FontAwesomeIcons.google,
            ),
            LoginMethodsButton(
              () {
                print('yyy');
              },
              type: "Sign up with Facebook",
              icon: FontAwesomeIcons.facebookF,
            ),
            LoginMethodsButton(
              () {
                Navigator.of(context).pushNamed('/reg-email');
              },
              type: "Sign up with Email",
              icon: FontAwesomeIcons.envelope,
            ),
            SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/signin');
              },
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.body1,
                  children: [
                    TextSpan(text: "Already have an account? "),
                    TextSpan(
                        text: "Sign in.", style: TextStyle(color: Colors.green))
                  ],
                ),
              ),
            ),
            SizedBox(height: 150.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 9.0),
              child: RichText(
                textAlign: TextAlign.center,
                softWrap: true,
                text: TextSpan(
                  style: Theme.of(context).textTheme.caption,
                  children: [
                    TextSpan(text: "By Signing up, You agree to our"),
                    TextSpan(
                      text: " Terms of Service ",
                      style: TextStyle(color: Colors.green),
                    ),
                    TextSpan(text: "and acknowledge that our"),
                    TextSpan(
                      text: " Privacy Policy ",
                      style: TextStyle(color: Colors.green),
                    ),
                    TextSpan(text: "applied to you."),
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
