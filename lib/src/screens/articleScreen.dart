import 'package:flutter/material.dart';
import 'package:medium_flutter/config/app_config.dart' as app;
import 'package:medium_flutter/provider/base_view.dart';
import 'package:medium_flutter/src/models/article.dart';
import 'package:medium_flutter/view/blogs_viewmodel.dart';

class ArticleScreen extends StatefulWidget {
  final Article article;
  ArticleScreen({this.article});
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<BlogsViewModel>(
      builder: (ctx, model, child) => Scaffold(
        appBar: AppBar(
          title: Text("Blog"),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.article.title,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      widget.article.text,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.black, radius: 10.0),
                        SizedBox(width: 10.0),
                        GestureDetector(
                          onTap: () {
                            print(widget.article.author.id);
                            Navigator.of(context).pushNamed("/profile",
                                arguments: widget.article.author.id);
                          },
                          child: Text(
                            widget.article.author.name,
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          '23 May 2020 - 5 min read ☆ ',
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      width: double.infinity,
                      height: app.App(context).appHeight(35),
                      color: (widget.article.featureImg != "")
                          ? Colors.transparent
                          : Colors.grey,
                      child: (widget.article.featureImg != "")
                          ? Image.network(widget.article.featureImg)
                          : null,
                    ),
                    SizedBox(height: 25.0),
                    Text(
                      widget.article.description,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .merge(TextStyle(height: 1.5)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.thumb_up_alt,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 30.0),
                  Icon(
                    Icons.bookmark_outline,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 30.0),
                  Icon(
                    Icons.share,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 30.0),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.font_download,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
