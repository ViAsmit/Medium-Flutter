import 'package:flutter/material.dart';
import 'package:medium_flutter/constant/appconstant.dart';
import 'package:medium_flutter/enum/view_state.dart';
import 'package:medium_flutter/provider/base_model.dart';
import 'package:medium_flutter/services/api_services.dart';
import 'package:medium_flutter/src/models/profile.dart';

class ProfileViewModel extends BaseModel {
  ApiService _apiService = ApiService();
  Profile user;

  void getProfile(BuildContext context, String id) async {
    final response =
        await _apiService.getProfileMethod(endpoint: "/users", id: id);
    if (!response.error) {
      setState(ViewState.Idle);
      user = profileFromJson(response.data);
      print(response.data);
      // print(user.user.following);
    } else {
      setState(ViewState.Idle);
      print(response.data);
      print(response.errorMessage);
      AppConstant.showFailToast(context, response.errorMessage);
    }
  }

  void followUser(BuildContext context, Map<String, dynamic> data) async {
    print(data);
    final response = await _apiService.followUserMethod(
        endpoint: "/users/follow", data: data);
    if (!response.error) {
      setState(ViewState.Idle);
    } else {
      setState(ViewState.Idle);
      print(response.data);
      print(response.errorMessage);
      AppConstant.showFailToast(context, response.errorMessage);
    }
  }
}
