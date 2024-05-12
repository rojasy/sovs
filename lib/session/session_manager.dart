import 'package:shared_preferences/shared_preferences.dart';

class SessionManager{
  saveAccessToken(String token)async{
    final preferences = await SharedPreferences.getInstance();
    preferences.setString('token', token);
  }

  Future<String?> getAccessToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString('token');
  }

}