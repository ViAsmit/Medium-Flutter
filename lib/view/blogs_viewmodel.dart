import 'package:flutter/material.dart';
import 'package:medium_flutter/constant/appconstant.dart';
import 'package:medium_flutter/enum/view_state.dart';
import 'package:medium_flutter/provider/base_model.dart';
import 'package:medium_flutter/services/api_services.dart';
import 'package:medium_flutter/src/models/article.dart';

class BlogsViewModel extends BaseModel {
  ApiService _apiService = ApiService();
  List<Article> articles = [];
}
