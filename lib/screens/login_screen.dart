import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sovs/screens/admin_home_screen.dart';
import 'package:sovs/screens/home_screen.dart';
import 'package:sovs/session/session_manager.dart';
import 'package:sovs/utils/constants.dart';

import '../config/authentication.dart';
import '../config/config_url.dart';
import '../models/logged_in_user_model.dart';
import '../operations/queries.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _passwordVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SessionManager sessionManager = SessionManager();


  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: Text("Loging in")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar:AppBar(backgroundColor: Colors.transparent,elevation: 0.0,),
      body:SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.asset("assets/images/uaut_logo.jpg"),
              ),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.grey], // Replace with your desired colors
                      begin: Alignment.topLeft, // Gradient starting point
                      end: Alignment.bottomRight, // Gradient ending point
                    ),

                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text("Welcome",style: TextStyle(color: primaryColor,fontSize: 30,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Text("Logn into smart vote",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: usernameController,
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: "Username",
                          isDense: true,
                          filled: true,
                          fillColor: Colors.white70,
                          contentPadding: EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none
                          )
                        ),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        controller: passwordController,
                        autofocus: false,
                        obscureText: _passwordVisible,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(onPressed: (){
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },icon: Icon(_passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,),),
                            hintText: "Password",
                            isDense: true,
                            filled: true,
                            fillColor: Colors.white70,
                            contentPadding: EdgeInsets.all(20),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none
                            )
                        ),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              padding: EdgeInsets.all(10),
                              minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              )
                          ),
                          onPressed: ()async{
                            if (_formKey.currentState!.validate()) {

                              showLoaderDialog(context);

                              String username = usernameController.text;
                              String password = passwordController.text;

                              debugPrint(password.toString());

                              debugPrint(username.toString());
                              print("iiiiiiii");
                              final AuthResult authResult =
                                  await Oauth2Httprequest.userAuthentication(
                                  username, password);
                              print("ioppp");  print(authResult.code);
                              String? sessionToken =
                                  await sessionManager.getAccessToken();
                              print("token");
                              print(sessionToken);
                              final String? message;
                              if (sessionToken != null && authResult.code == 200) {

                                Navigator.of(context).pop();

                                message = authResult.message;
                                debugPrint('Success ${authResult.code}');
                              } else {

                                Navigator.of(context).pop();

                                debugPrint('fail ${authResult.code}');
                                message = authResult.message;
                              }



                              if (sessionToken != null && authResult.code == 200) {
                                if (mounted) {
                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.success,
                                    text: message,
                                  );

                                  await fetchGraphQLData();

                                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomeScreen()), (route) => false);

                                  SovsQueriesServices sovsService = SovsQueriesServices();
                                  GetLoggedInUserResponse loggedUser = await sovsService.getLoggedInUser();


                                  // String role = loggedUser.getLoggedInUser.data.roles.;

                                  //
                                  // print("userProfileAndRole.getUserProfileAndRole.data.userProfile.profileType");
                                  // print(userProfileAndRole.getUserProfileAndRole.data.userProfile.profileType);
                                  //
                                  //
                                  // // GetUserProfileAndRoleProvider provider =  GetUserProfileAndRoleProvider();
                                  //
                                  // var userProfile = userProfileAndRole.getUserProfileAndRole.data.userProfile.profileType;
                                  // String institutionUniqueId = userProfileAndRole.getUserProfileAndRole.data.userProfile.profileType;
                                  //
                                  // await sessionManager.saveInstitutionId(institutionUniqueId);
                                  //
                                  // print("institutionUniqueId");
                                  // print(institutionUniqueId);
                                  //
                                  //
                                  // print("user?.profileType");
                                  // print(userProfile);
                                  //
                                  // if (userProfile == "INSTITUTION_ADMIN") {
                                  //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AdminDashboardScreen()));
                                  // }else {
                                  //
                                  //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
                                  // }


                                }
                                debugPrint(
                                    'Authentication successful! Access Token: ${sessionToken}${authResult.message}${authResult.code}');
                              } else {
                                if (mounted) {
                                  QuickAlert.show(
                                    context: context,
                                    type: QuickAlertType.error,
                                    text: message,
                                  );
                                }
                                debugPrint(
                                    'Authentication failed. Error: ${sessionToken} ${authResult.message}${authResult.code}');
                              }
                            }
                            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                            // Navigator.of(context).pushReplacement(
                            //   MaterialPageRoute(
                            //       builder: (_) =>
                            //           HomeScreen()),
                            // );


                                    }, child: Text("Login",style: TextStyle(color: textColor),)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }


  Future<void> fetchGraphQLData() async {
    try {
      String? accessToken = await SessionManager().getAccessToken();

      if (accessToken != null && accessToken.isNotEmpty) {
        await initGraphQLClient();

      } else {
        // Handle case where access token is null or empty
      }
    } catch (e) {
      // Handle GraphQL fetch errors
    }
  }


}
