import 'package:flutter/material.dart';
import 'package:medium_flutter/constant/appconstant.dart';
import 'package:medium_flutter/enum/view_state.dart';
import 'package:medium_flutter/provider/base_model.dart';
import 'package:medium_flutter/services/api_services.dart';
import 'package:medium_flutter/src/models/article.dart';

class BlogsViewModel extends BaseModel {
  ApiService _apiService = ApiService();
  List<Article> articles = [];

  void getArticles(BuildContext context) async {
    articles = [];
    final response = await _apiService.getArticlesMethod(endpoint: "/posts");
    if (!response.error) {
      setState(ViewState.Idle);
      print(response.data);
      for (var res in response.data) {
        final web = articleFromJson(res);
        articles.add(web);
      }
      print(articles);
    } else {
      setState(ViewState.Idle);
      print(response.data);
      print(response.errorMessage);
      AppConstant.showFailToast(context, response.errorMessage);
    }
  }
}
