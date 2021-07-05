import 'package:flutter/material.dart';
import 'package:medium_flutter/src/models/article.dart';
import 'package:medium_flutter/src/utils/utils.dart';

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
  bool bookmarked = false;

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
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed("/article", arguments: widget.article);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.article.title,
                        style: Theme.of(context).textTheme.display1,
                        softWrap: true,
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        widget.article.text,
                        style: Theme.of(context).textTheme.subtitle1,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 100.0,
                width: 100.0,
                child: (widget.article.featureImg == "")
                    ? Image.asset('assets/images/logo.png',
                        height: 100.0, width: 100.0)
                    : Image.network(widget.article.featureImg),
              )
            ],
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.article.author.name} in Towards Data Science',
                  style: Theme.of(context).textTheme.subtitle,
                ),
                Text(
                  '${Utils.formatDate(widget.article.date)} - 5 min read ☆ ',
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  bookmarked = !bookmarked;
                });
              },
              icon: Icon(!bookmarked ? Icons.bookmark_outline : Icons.bookmark),
            ),
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
