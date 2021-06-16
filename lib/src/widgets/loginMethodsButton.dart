import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginMethodsButton extends StatelessWidget {
  final String type;
  final IconData icon;
  final Function handleTap;
  LoginMethodsButton(this.handleTap, {this.type, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        color: Theme.of(context).backgroundColor,
        child: Row(
          children: [
            SizedBox(width: 20.0),
            Icon(icon),
            SizedBox(width: 80.0),
            Text(type),
          ],
        ),
        onPressed: handleTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
