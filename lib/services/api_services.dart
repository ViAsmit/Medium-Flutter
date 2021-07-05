import 'package:medium_flutter/services/api-response.dart';
import 'package:medium_flutter/services/api_urls.dart';
import 'package:medium_flutter/services/base_api.dart';

class ApiService extends BaseApi {
  // Login ViewModel
  Future<ApiResponse> signupMethod(data) async {
    ApiResponse response;
    try {
      response = await signUp(data, '/users/register/');
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }

    return response;
  }

  Future<ApiResponse> loginMethod(data) async {
    ApiResponse response;
    try {
      response = await signUp(data, "users/login");
      print('no error');
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }

    return response;
  }

  Future<ApiResponse> getArticlesMethod({String endpoint}) async {
    ApiResponse response;
    try {
      response = await getRequest(endpoint: endpoint);
      print('no error');
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }
    return response;
  }

  Future<ApiResponse> postArticleMethod(
      {String endpoint, Map<String, dynamic> data}) async {
    ApiResponse response;
    try {
      response = await postRequest(endpoint, data);
      print('no error');
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }

    return response;
  }

  Future<ApiResponse> getProfileMethod({String endpoint, String id}) async {
    ApiResponse response;
    try {
      response = await getRequest(endpoint: endpoint, query: {"user_id": id});
      print('no error');
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }

    return response;
  }

  Future<ApiResponse> followUserMethod(
      {String endpoint, Map<String, dynamic> data}) async {
    ApiResponse response;
    try {
      response = await postRequest(endpoint, data);
      print('no error');
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }

    return response;
  }
}
