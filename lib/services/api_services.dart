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

  Future<ApiResponse> getWebsiteMethod({String endpoint}) async {
    ApiResponse response;
    try {
      response = await getRequest(endpoint: endpoint);
      print('no error');
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }

    return response;
  }

  Future<ApiResponse> postWebsiteMethod(
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

  Future<ApiResponse> patchWebsiteMethod(
      {String endpoint, Map<String, dynamic> data}) async {
    ApiResponse response;
    try {
      response = await patchRequest(endpoint, data);
      print('no error');
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }
    return response;
  }

  Future<ApiResponse> deleteWebsiteMethod({String endpoint, String id}) async {
    ApiResponse response;
    try {
      response = await deleteRequest(endpoint: endpoint, id: id);
      print('no error');
    } catch (e) {
      response = ApiResponse(error: true, errorMessage: e.toString());
    }
    return response;
  }

  // Website ViewModel

}
