// import 'package:medium_flutter/config/ui_icons.dart';
// import 'package:medium_flutter/src/models/user.dart';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:medium_flutter/services/prefs_services.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  void initState() {
    super.initState();
    print(Prefs().getUid());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/profile', arguments: Prefs().getUid());
            },
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(),
              accountName: Text(
                'Asmit Vimal',
                style: Theme.of(context).textTheme.title,
              ),
              accountEmail: Text(
                'View Profile',
                style: Theme.of(context).textTheme.caption,
              ),
              onDetailsPressed: () {
                print('yyy');
              },
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              // Navigator.of(context).pushNamed('/Tabs', arguments: 2);
            },
            title: Text(
              "Home",
              style: Theme.of(context).textTheme.subhead,
            ),
          ),
          ListTile(
            onTap: () {
              // Navigator.of(context).pushNamed('/Tabs', arguments: 1);
            },
            title: Text(
              "Audio",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          ListTile(
            onTap: () {
              // Navigator.of(context).pushNamed('/Orders', arguments: 0);
            },
            title: Text(
              "Reading List",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          ListTile(
            onTap: () {
              // Navigator.of(context).pushNamed('/Tabs', arguments: 4);
            },
            title: Text(
              "Audio",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          ListTile(
            title: Text(
              "Become a Member",
              style: Theme.of(context)
                  .textTheme
                  .body2
                  .merge(TextStyle(color: Colors.green)),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed("/editor");
            },
            title: Text(
              "New Story",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          ListTile(
            onTap: () {
              // Navigator.of(context).pushNamed('/Brands');
            },
            title: Text(
              "Stats",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          ListTile(
            title: Text(
              "Stories",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 80.0,
                width: 100.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/settings');
                },
                child: Text('Settings'),
              ),
              Text('Help')
            ],
          )
        ],
      ),
    );
  }
}
