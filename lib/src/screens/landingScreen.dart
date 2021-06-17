import 'package:flutter/material.dart';
import 'package:medium_flutter/provider/base_view.dart';
import 'package:medium_flutter/src/models/article.dart';
import 'package:medium_flutter/src/widgets/DrawerWidget.dart';
import 'package:medium_flutter/view/blogs_viewmodel.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BaseView<BlogsViewModel>(
      onModelReady: (model) => model.getArticles(context),
      builder: (ctx, model, build) => Scaffold(
        key: _scaffoldKey,
        drawer: DrawerWidget(),
        appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).backgroundColor,
          title: Text('Home'),
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          actions: [
            Icon(Icons.notifications_none_outlined),
            SizedBox(width: 25.0),
            Icon(Icons.search),
            SizedBox(width: 10.0),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          child: ListView.builder(
            itemCount: model.articles.length,
            itemBuilder: (context, idx) {
              return BlogCard(
                article: model.articles[idx],
              );
            },
          ),
        ),
      ),
    );
  }
}

class BlogCard extends StatefulWidget {
  final Article article;
  BlogCard({this.article});
  @override
  _BlogCardState createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  final List<String> options = [
    'Dismiss this story',
    'Mute this author',
    'Mute this piblication'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5.0),
        Text(
          'BASED ON YOUR READING HISTORY',
          style: Theme.of(context).textTheme.caption.merge(
              TextStyle(color: Theme.of(context).hintColor.withOpacity(0.5))),
        ),
        SizedBox(height: 20.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                'An Introduction to Optical Character Recognition for Beginners',
                style: Theme.of(context).textTheme.display1,
                softWrap: true,
              ),
            ),
            Image.asset('assets/images/logo.png', height: 100.0, width: 100.0),
          ],
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Asmit Vimal in Towards Data Science',
                  style: Theme.of(context).textTheme.subtitle,
                ),
                Text(
                  '23 May 2020 - 5 min read ☆ ',
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
            Icon(Icons.bookmark_outline),
            PopupMenuButton(
              icon: Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) {
                return options.map((item) {
                  return PopupMenuItem(
                    value: item,
                    child:
                        Text(item, style: Theme.of(context).textTheme.caption),
                  );
                }).toList();
              },
            ),
          ],
        ),
        Divider(thickness: 1.0),
      ],
    );
  }
}
