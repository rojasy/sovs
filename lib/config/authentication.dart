import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../session/session_manager.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';



class AuthResult {
  final String? accessToken;
  final String? message;
  final int? code;
  AuthResult({this.accessToken,this.code, this.message});
}

class Oauth2Httprequest {
  static final SessionManager sessionManager = SessionManager();

  static userAuthentication(String username, String password) async {
    try {
      const String tokenUrl = "${graphqlUrl}/auth/login";

      const String clientId = '106c09ac013a24285ec7';
      const String clientSecret = 'cc135aa6451b807456f61a1365d50213e407f523';

      final Map<String, String> data = {
        'username': username,
        'password': password,
      };

      final http.Response response =
      await http.post(Uri.parse(tokenUrl), body: data);

      // QuickAlert.show(
      //   context: context,
      //   type: QuickAlertType.loading,
      //   title: 'Loading',
      //   text: 'Fetching your data',
      // );
      

      if (response.statusCode == 200) {
        print("Response");
        print(response.body);
        final Map<String, dynamic> tokenData = json.decode(response.body);
        final String accessToken = tokenData['data']['token'];
        debugPrint('Token: $accessToken');
        sessionManager.saveAccessToken(accessToken);
        String? sessionToken=await sessionManager.getAccessToken();

        // sessionManager.saveRememberMe(true);
        return AuthResult(
            accessToken: sessionToken,code:response.statusCode, message: 'Login Successfully');
      } else {
        debugPrint('Error: ${response.statusCode} - ${response.body}');
        return AuthResult(
            accessToken: null,code:response.statusCode, message: "Invalid Credentials! Try Again.");
      }
    } catch (e, stacktrace) {
      debugPrint(e.toString());
      debugPrint(stacktrace.toString());
      return AuthResult(
          accessToken: null,
          message: 'An error occurred during authentication.');
    }
  }
 static Future<AuthResult> logout() async{
    sessionManager.saveAccessToken('');
    String? sessionToken=await sessionManager.getAccessToken();
    // sessionManager.saveRememberMe(false);
    return AuthResult(
        accessToken: sessionToken,
        message: 'Logout Successfully');
  }

}
