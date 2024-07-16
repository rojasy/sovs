import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/users_controller.dart';
import '../utils/constants.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  GlobalKey<FormState> _Key = GlobalKey();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
  }


  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter password';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm password';
    }
    if (value != newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: Text("Updating Password")),
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Change Password",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),centerTitle: true,backgroundColor: primaryColor,iconTheme: IconThemeData(color: whiteColor)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _Key,
            child: Column(
              children: [
                SizedBox(height: 20,),
                TextFormField(
                  controller: oldPasswordController,
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

                      hintText: "Old Password",
                      isDense: true,
                      filled: true,
                      fillColor: primaryColor.withOpacity(0.3),
                      contentPadding: EdgeInsets.all(20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                      )
                  ),
                  validator: _validatePassword,
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: newPasswordController,
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

                      hintText: "New Password",
                      isDense: true,
                      filled: true,
                      fillColor: primaryColor.withOpacity(0.3),
                      contentPadding: EdgeInsets.all(20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                      )
                  ),
                  validator: _validatePassword,
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: confirmPasswordController,
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

                      hintText: "Confirm Password",
                      isDense: true,
                      filled: true,
                      fillColor: primaryColor.withOpacity(0.3),
                      contentPadding: EdgeInsets.all(20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none
                      )
                  ),
                  validator: _validateConfirmPassword,
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

                      if (_Key.currentState!.validate()) {
                        showLoaderDialog(context);

                        Map<String,dynamic>? output = await Provider.of<GetUsersController>(context, listen: false).
                        changePassword(context, oldPasswordController.text, newPasswordController.text);

                        String message = output?['changePassword']['message'];
                        bool error = output?['changePassword']['error'];

                        if(error == false){
                          Navigator.pop(context);
                          ScaffoldMessenger.of(
                              context)
                              .showSnackBar(
                              SnackBar(content: Text(message)));
                          Navigator.of(
                              context)
                              .pop();

                        }else{
                          Navigator.pop(context);

                          ScaffoldMessenger.of(
                              context)
                              .showSnackBar(
                              SnackBar(content: Text(message),backgroundColor: errorColor,));
                          Navigator.of(
                              context)
                              .pop();
                        }
                      }

                    }, child: Text("Change Password",style: TextStyle(color: whiteColor),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
