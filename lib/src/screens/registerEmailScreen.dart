import 'package:flutter/material.dart';
import 'package:medium_flutter/config/app_config.dart' as device;
import 'package:medium_flutter/provider/base_view.dart';
import 'package:medium_flutter/view/login_viewmodel.dart';

class RegisterEmailScreen extends StatefulWidget {
  @override
  _RegisterEmailScreenState createState() => _RegisterEmailScreenState();
}

class _RegisterEmailScreenState extends State<RegisterEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      builder: (ctx, model, child) => Scaffold(
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
              SizedBox(height: 40.0),
              Text(
                'Sign up With Email',
                style: Theme.of(context)
                    .textTheme
                    .display4
                    .merge(TextStyle(fontSize: 50.0)),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.0),
              Text('Your Username'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  controller: model.nameCtl,
                  textAlign: TextAlign.center,
                  cursorHeight: 30.0,
                  style: Theme.of(context).textTheme.bodyText1,
                  cursorColor: Theme.of(context).primaryColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1.5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Text('Your Email'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  controller: model.emailCtl,
                  textAlign: TextAlign.center,
                  cursorHeight: 30.0,
                  style: Theme.of(context).textTheme.bodyText1,
                  cursorColor: Theme.of(context).primaryColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1.5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Text('Your Password'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  controller: model.passCtl,
                  textAlign: TextAlign.center,
                  cursorHeight: 30.0,
                  style: Theme.of(context).textTheme.bodyText1,
                  obscureText: true,
                  cursorColor: Theme.of(context).primaryColor,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1.5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Text('Confirm Password'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: TextField(
                  controller: model.confirmCtl,
                  textAlign: TextAlign.center,
                  cursorHeight: 30.0,
                  style: Theme.of(context).textTheme.bodyText1,
                  obscureText: true,
                  cursorColor: Theme.of(context).primaryColor,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 1.5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              FlatButton(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                onPressed: () {
                  model.signup(context);
                },
                child: Text(
                  'Sing Up',
                  style: Theme.of(context).textTheme.title.merge(
                        TextStyle(color: Colors.white),
                      ),
                ),
                color: Colors.green,
                shape: StadiumBorder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
