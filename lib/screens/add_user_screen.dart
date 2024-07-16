import 'package:dropdown_button2/dropdown_button2.dart';
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
  TextEditingController passwordController = TextEditingController();

  String courseValue = '';


  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: Text("Adding User")),
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
                controller: passwordController,
                autofocus: false,
                decoration: InputDecoration(
                    hintText: "Password",
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
              _buildDropdownUserCourse(UserCourse.values),
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
                        lastNameController.text,passwordController.text, phoneController.text, usernameController.text,courseValue);

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

  Widget _buildDropdownUserCourse(List<UserCourse> items) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      // padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
            hintText: "Select Course",
            // Add Horizontal padding using menuItemStyleData.padding so it matches
            // the menu padding when button's width is not specified.
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            border: const OutlineInputBorder(
              // borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
            isDense: true,
            filled: true,
            fillColor: primaryColor.withOpacity(0.3),
            // Add more decoration..
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            )),
        hint: Text("Select Course"),
        items: items
            .map((item) => DropdownMenuItem<String>(
          value: item.name,
          child: Text(item.name,
            style: const TextStyle(color: Colors.black),
          ),
        ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return "Course needed";
          }
          return null;
        },
        onChanged: (value) {
          setState(() {
            courseValue = value!;
            // dropdownValue = value;
          });
          //_controller.getFinancialHighLeastProjectConsumingRateGraph(selectedValue);
          //Do something when selected item is changed.
        },
        onSaved: (value) {
          setState(() {
            courseValue = value.toString();
          });
          // dropdownValue = value.toString();
        },
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black45,
          ),
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }


}

enum UserCourse{
  COET,
  COBA
}
