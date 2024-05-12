import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sovs/screens/home_screen.dart';
import 'package:sovs/session/session_manager.dart';
import 'package:sovs/utils/constants.dart';

import '../config/authentication.dart';
import '../config/config_url.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar:AppBar(backgroundColor: Colors.transparent,elevation: 0.0,),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 18.0),
        child: SingleChildScrollView(
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
                Text("UAUTso Smart Voting",style: TextStyle(color: secondaryColor,fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                Text("Logn",style: TextStyle(color: secondaryColor,fontSize: 20,fontWeight: FontWeight.bold),),
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
                  decoration: InputDecoration(
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
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.5, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        )
                    ),
                    onPressed: ()async{
                      if (_formKey.currentState!.validate()) {
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
                          message = authResult.message;
                          debugPrint('Success ${authResult.code}');
                        } else {
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

                            // WerisQueries werisQuery = WerisQueries();
                            // GetUserProfileAndRoleResponse userProfileAndRole = await werisQuery.getUserProfileAndRole();
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
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => AdminDashboardScreen()));
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //       builder: (_) =>
                      //           AdminDashboardScreen()),
                      // );


              }, child: Text("Login",style: TextStyle(color: textColor),))
              ],
            ),
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
