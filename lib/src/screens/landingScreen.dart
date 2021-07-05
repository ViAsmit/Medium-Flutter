import 'package:flutter/material.dart';
import 'package:medium_flutter/provider/base_view.dart';
import 'package:medium_flutter/src/widgets/BlogCard.dart';
import 'package:medium_flutter/src/widgets/DrawerWidget.dart';
import 'package:medium_flutter/view/blogs_viewmodel.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
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
          child: SmartRefresher(
            enablePullDown: true,
            header: WaterDropMaterialHeader(),
            controller: _refreshController,
            onRefresh: () {
              model.getArticles(context);
              _refreshController.refreshCompleted();
            },
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
      ),
    );
  }
}
