import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sovs/controllers/users_controller.dart';

import '../utils/constants.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add User",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),centerTitle: true,backgroundColor: primaryColor,iconTheme: IconThemeData(color: whiteColor)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              TextFormField(
                controller: firstNameController,
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "First Name",
                    isDense: true,
                    filled: true,
                    fillColor: primaryColor.withOpacity(0.3),
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                    )
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: lastNameController,
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "Last Name",
                    isDense: true,
                    filled: true,
                    fillColor: primaryColor.withOpacity(0.3),
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                    )
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: usernameController,
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "Username",
                    isDense: true,
                    filled: true,
                    fillColor: primaryColor.withOpacity(0.3),
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                    )
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: emailController,
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "Email",
                    isDense: true,
                    filled: true,
                    fillColor: primaryColor.withOpacity(0.3),
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                    )
                ),
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: phoneController,
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "Phone Number",
                    isDense: true,
                    filled: true,
                    fillColor: primaryColor.withOpacity(0.3),
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                    )
                ),
              ),
              SizedBox(height: 10,),
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

                    showLoaderDialog(context);

                    Map<String,dynamic>? output = await Provider.of<GetUsersController>(context, listen: false).createUser(context, emailController.text, firstNameController.text,
                        lastNameController.text, phoneController.text, usernameController.text);

                    String message = output?['createUpdateUser']['message'];
                    bool error = output?['createUpdateUser']['error'];

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

                  }, child: Text("Add User",style: TextStyle(color: whiteColor),))
            ],
          ),
        ),
      ),
    );
  }
}
