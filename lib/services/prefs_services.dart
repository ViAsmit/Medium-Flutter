import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  final String _userIDStorageKey = 'USER_ID';
  final String _authTokenStorageKey = 'AUTH_TOKEN';
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static String _authToken;
  getToken() => _authToken;
  Future<String> getAuthToken() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(_authTokenStorageKey) ?? '';
  }

  Future<void> setAuthToken(String token) async {
    final SharedPreferences prefs = await _prefs;
    _authToken = token;
    prefs.setString(_authTokenStorageKey, token);
  }

  Future<void> setUID(String uID) async {
    final SharedPreferences prefs = await _prefs;
    //print('called: $_userID');
    prefs.setString(_userIDStorageKey, uID);
  }
}
