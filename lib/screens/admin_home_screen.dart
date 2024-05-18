import 'package:flutter/material.dart';
import 'package:sovs/screens/users_screen.dart';

import '../config/authentication.dart';
import '../utils/constants.dart';
import 'election_screen.dart';
import 'login_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Welcome Admin"),backgroundColor: primaryColor,iconTheme: IconThemeData(color: Colors.white),),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    // Navigator.of(context).pop();
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/uaut_logo.jpg'),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Rojasy Ngaiza',
                        // style: normalStyle,
                      ),
                      Text(
                        'Super Admin',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Divider(),
                SizedBox(height: 20,),

                ListTile(title: Text("Dashboard"),
                  trailing: Icon(Icons.arrow_forward_ios,color: primaryColor,),
                  leading: Icon(Icons.dashboard,color: primaryColor,),
                  onTap: (){},),

                SizedBox(height: 15,),
                ListTile(title: Text("Users"),
                  trailing: Icon(Icons.arrow_forward_ios,color: primaryColor,),
                  leading: Icon(Icons.other_houses_outlined,color: primaryColor,),
                  onTap: (){

                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UsersScreen()));
                  },),

                SizedBox(height: 15,),
                ListTile(title: Text("Candidate"),
                  trailing: Icon(Icons.arrow_forward_ios,color: primaryColor,),
                  leading: Icon(Icons.dashboard,color: primaryColor,),
                  onTap: (){},),

                SizedBox(height: 15,),
                ListTile(title: Text("Election"),
                  trailing: Icon(Icons.arrow_forward_ios,color: primaryColor,),
                  leading: Icon(Icons.dashboard,color: primaryColor,),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ElectionScreen()));
                  },),
                SizedBox(height: 15,),
                ListTile(title: Text("Votes"),
                  trailing: Icon(Icons.arrow_forward_ios,color: primaryColor,),
                  leading: Icon(Icons.dashboard,color: primaryColor,),
                  onTap: (){
                    // Navigator.of(context).pop();
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ReportScreen()));
                  },),
                SizedBox(height: 15,),
                ListTile(title: Text("Logout"),
                  trailing: Icon(Icons.arrow_forward_ios,color: primaryColor,),
                  leading: Icon(Icons.logout,color: primaryColor,),
                  onTap: ()async{
                    await Oauth2Httprequest.logout();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
