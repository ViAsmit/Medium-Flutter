import 'package:flutter/material.dart';
import 'package:medium_flutter/provider/base_view.dart';
import 'package:medium_flutter/services/prefs_services.dart';
import 'package:medium_flutter/src/widgets/ProfileBlogCard.dart';
import 'package:medium_flutter/view/profile_viewmodel.dart';

class ProfileScreen extends StatefulWidget {
  final String id;
  ProfileScreen({this.id});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      onModelReady: (model) => model.getProfile(context, widget.id),
      builder: (ctx, model, build) => Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: Text('Profile'),
          actions: [
            (model.user.user.id != Prefs().getUid())
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: RaisedButton(
                      onPressed: () {
                        var user_id = Prefs().getUid();
                        var to_follow_id = model.user.user.id;
                        model.followUser(
                          context,
                          {"user_id": user_id, "to_follow_id": to_follow_id},
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      color: Colors.green,
                      textColor: Theme.of(context).backgroundColor,
                      child: Text(
                          (model.user.user.followers.contains(Prefs().getUid()))
                              ? "Following"
                              : "Follow"),
                    ),
                  )
                : SizedBox(),
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
                model.user.user.name,
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(model.user.user.email),
              SizedBox(height: 10.0),
              Divider(),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '${model.user.user.following.length} Following',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    '${model.user.user.followers.length} Folowers',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: model.user.articles.length,
                  itemBuilder: (context, idx) {
                    return ProfileBlogCard(
                      article: model.user.articles[idx],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
