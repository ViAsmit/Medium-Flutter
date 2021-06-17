// To parse this JSON data, do
//
//     final article = articleFromJson(jsonString);

import 'dart:convert';

Article articleFromJson(str) => Article.fromJson(str);

String articleToJson(Article data) => json.encode(data.toJson());

class Article {
  Article({
    this.id,
    this.text,
    this.title,
    this.claps,
    this.description,
    this.featureImg,
    this.author,
    this.comments,
    this.v,
  });

  String id;
  String text;
  String title;
  int claps;
  String description;
  String featureImg;
  Author author;
  List<Comment> comments;
  int v;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["_id"],
        text: json["text"],
        title: json["title"],
        claps: json["claps"],
        description: json["description"],
        featureImg: json["feature_img"],
        author: Author.fromJson(json["author"]),
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "text": text,
        "title": title,
        "claps": claps,
        "description": description,
        "feature_img": featureImg,
        "author": author.toJson(),
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
        "__v": v,
      };
}

class Author {
  Author({
    this.profileImage,
    this.followers,
    this.following,
    this.id,
    this.email,
    this.salt,
    this.password,
    this.v,
  });

  String profileImage;
  List<String> followers;
  List<String> following;
  String id;
  String email;
  String salt;
  String password;
  int v;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        profileImage: json["profile_image"],
        followers: List<String>.from(json["followers"].map((x) => x)),
        following: List<String>.from(json["following"].map((x) => x)),
        id: json["_id"],
        email: json["email"],
        salt: json["salt"],
        password: json["password"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "profile_image": profileImage,
        "followers": List<dynamic>.from(followers.map((x) => x)),
        "following": List<dynamic>.from(following.map((x) => x)),
        "_id": id,
        "email": email,
        "salt": salt,
        "password": password,
        "__v": v,
      };
}

class Comment {
  Comment({
    this.id,
    this.author,
    this.text,
  });

  String id;
  Author author;
  String text;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["_id"],
        author: Author.fromJson(json["author"]),
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "author": author.toJson(),
        "text": text,
      };
}
