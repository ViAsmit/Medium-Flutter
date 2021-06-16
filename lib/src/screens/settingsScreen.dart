import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medium_flutter/services/prefs_services.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> displayOptions = ["Battery Saver", "Dark", "Light"];
  String displayValue = "Battery Saver";
  bool disableImageLoad = false;
  bool limitUsage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).backgroundColor,
        title: Text('Settings'),
      ),
      body: Container(
        // padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: ListView(
          children: [
            ListTile(
              horizontalTitleGap: 0.0,
              leading: FaIcon(
                FontAwesomeIcons.facebook,
                size: 20.0,
                // color: Colors.blue,
              ),
              title: Text(
                'Facebook',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: GestureDetector(
                child: Text(
                  "Connect",
                  style: TextStyle(color: Colors.green, fontSize: 15.0),
                ),
              ),
            ),
            ListTile(
              horizontalTitleGap: 0.0,
              leading: FaIcon(
                FontAwesomeIcons.twitter,
                size: 20.0,
                // color: Colors.blue,
              ),
              title: Text(
                'Twitter',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: GestureDetector(
                child: Text(
                  "Connect",
                  style: TextStyle(color: Colors.green, fontSize: 15.0),
                ),
              ),
            ),
            ListTile(
              horizontalTitleGap: 0.0,
              title: Text(
                'Dark Mode',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: PopupMenuButton(
                onSelected: (val) {
                  setState(() {
                    displayValue = val;
                  });
                },
                child: Text(
                  displayValue,
                  style: TextStyle(color: Colors.green, fontSize: 15.0),
                ),
                itemBuilder: (BuildContext context) {
                  return displayOptions.map(
                    (item) {
                      return PopupMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      );
                    },
                  ).toList();
                },
              ),
            ),
            ListTile(
              horizontalTitleGap: 0.0,
              title: Text(
                'Disable Image Loading',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: Checkbox(
                onChanged: (val) {
                  setState(() {
                    disableImageLoad = val;
                  });
                },
                checkColor: Theme.of(context).backgroundColor,
                activeColor: Colors.green,
                value: disableImageLoad,
              ),
            ),
            ListTile(
              horizontalTitleGap: 0.0,
              title: Text(
                'Limit Background Data Usage to WiFi Only',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              trailing: Checkbox(
                onChanged: (val) {
                  setState(() {
                    limitUsage = val;
                  });
                },
                checkColor: Theme.of(context).backgroundColor,
                activeColor: Colors.green,
                value: limitUsage,
              ),
            ),
            ListTile(
              horizontalTitleGap: 0.0,
              title: Text(
                'Push Notifications',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            ListTile(
              horizontalTitleGap: 0.0,
              title: Text(
                'Email Notification',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            ListTile(
              horizontalTitleGap: 0.0,
              title: Text(
                'My Account',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            ListTile(
              horizontalTitleGap: 0.0,
              title: Text(
                'Join Our Community',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            ListTile(
              onTap: () {
                signOut(context);
              },
              horizontalTitleGap: 0.0,
              title: Text(
                'Sign Out',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void signOut(BuildContext context) async {
  Prefs _prefs = Prefs();
  await _prefs.deleteTokens();
  Navigator.of(context).pushNamedAndRemoveUntil('/signin', (route) => false);
}
