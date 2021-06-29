import 'package:flutter/material.dart';
import 'package:medium_flutter/constant/appconstant.dart';
import 'package:medium_flutter/enum/view_state.dart';
import 'package:medium_flutter/provider/base_model.dart';
import 'package:medium_flutter/services/api_services.dart';
import 'package:medium_flutter/services/prefs_services.dart';

class LoginViewModel extends BaseModel {
  ApiService _apiService = ApiService();
  Prefs _prefs = Prefs();
  TextEditingController nameCtl = TextEditingController();
  TextEditingController emailCtl = TextEditingController();
  TextEditingController passCtl = TextEditingController();
  TextEditingController confirmCtl = TextEditingController();

  void signup(BuildContext context) async {
    setState(ViewState.Busy);
    final data = {
      "name": nameCtl.text,
      "email": emailCtl.text,
      "password": passCtl.text,
      "password_confirm": confirmCtl.text,
    };
    print(data);
    final response = await _apiService.signupMethod(data);
    print(response);
    if (!response.error) {
      setState(ViewState.Idle);
      print('=====');
      print(response.data);
      print('=====');
      _prefs.setAuthToken(response.data['token']);
      _prefs.setUID(response.data['uid'].toString());

      print('success');
      navigationService.navigateTo('/', withreplacement: true);
    } else {
      setState(ViewState.Idle);
      AppConstant.showFailToast(context, response.errorMessage);
    }
  }

  void logIn(BuildContext context) async {
    setState(ViewState.Busy);
    final data = {
      'email': emailCtl.text,
      'password': passCtl.text,
    };
    print(data);
    final response = await _apiService.loginMethod(data);
    if (!response.error) {
      print('=====');
      print(response.data);
      print('=====');
      setState(ViewState.Idle);
      _prefs.setAuthToken(response.data['token']);
      _prefs.setUID(response.data['uid'].toString());
      print('success');
      navigationService.navigateTo('/', withreplacement: true);
    } else {
      setState(ViewState.Idle);
      AppConstant.showFailToast(context, response.errorMessage);
    }
  }
}
