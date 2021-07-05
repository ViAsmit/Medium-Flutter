// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

import 'package:medium_flutter/src/models/article.dart';

Profile profileFromJson(str) => Profile.fromJson(str);

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    this.user,
    this.articles,
  });

  User user;
  List<Article> articles;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        user: User.fromJson(json["user"]),
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class User {
  User({
    this.profileImage,
    this.followers,
    this.following,
    this.id,
    this.email,
    this.name,
    this.salt,
    this.password,
    this.v,
  });

  String profileImage;
  List<dynamic> followers;
  List<dynamic> following;
  String id;
  String email;
  String name;
  String salt;
  String password;
  int v;

  factory User.fromJson(Map<String, dynamic> json) => User(
        profileImage: json["profile_image"],
        followers: List<dynamic>.from(json["followers"].map((x) => x)),
        following: List<dynamic>.from(json["following"].map((x) => x)),
        id: json["_id"],
        email: json["email"],
        name: json["name"],
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
        "name": name,
        "salt": salt,
        "password": password,
        "__v": v,
      };
}
