import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text('Profile'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) {
              return ['Edit'].map((item) {
                return PopupMenuItem(value: item, child: Text(item));
              }).toList();
            },
          ),
          SizedBox(width: 10.0),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40.0,
                backgroundColor: Theme.of(context).accentColor,
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Asmit Vimal',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text('asmit.vml.962@gmail.com'),
            SizedBox(height: 10.0),
            Divider(),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '1 Following',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  '0 Folowers',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Divider()
          ],
        ),
      ),
    );
  }
}
