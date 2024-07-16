import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sovs/screens/profile_screen.dart';
import 'package:sovs/screens/users_screen.dart';

import '../config/authentication.dart';
import '../controllers/dashboard_controller.dart';
import '../controllers/logged_in_user_controller.dart';
import '../utils/constants.dart';
import 'candidateScreen.dart';
import 'election_screen.dart';
import 'login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),centerTitle: true,backgroundColor: primaryColor,iconTheme: IconThemeData(color: whiteColor)),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                     Navigator.of(context).pop();
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen()));
                  },
                  child: Consumer<GetLoggedInUserController>(
                    builder: (context,profileData,_){
                      if (profileData.getLoggedUser != null && profileData.getLoggedUser!.roles.isNotEmpty) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage('assets/images/uaut_logo.jpg'),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '${profileData.getLoggedUser!.fullName}',
                              // style: normalStyle,
                            ),
                            Text(
                              '${profileData.getLoggedUser!.roles.single.name}',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        );
                      } else {
                        return CircularProgressIndicator(); // or another placeholder widget
                      }
                    },
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
                  onTap: (){

                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CandidateScreen()));
                  },),

                SizedBox(height: 15,),
                ListTile(title: Text("Election"),
                  trailing: Icon(Icons.arrow_forward_ios,color: primaryColor,),
                  leading: Icon(Icons.dashboard,color: primaryColor,),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ElectionScreen()));
                  },),
                SizedBox(height: 15,),
                // ListTile(title: Text("Votes"),
                //   trailing: Icon(Icons.arrow_forward_ios,color: primaryColor,),
                //   leading: Icon(Icons.dashboard,color: primaryColor,),
                //   onTap: (){
                //     // Navigator.of(context).pop();
                //     // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ReportScreen()));
                //   },),
                // SizedBox(height: 15,),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<DashboardController>(
          builder: (context,dashboardData,_){
            if (!isLoaded) {
              dashboardData.getDashboardFunction();
              isLoaded = true;
            }
            return SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: () async {
                await dashboardData.refreshData();
                _refreshController.refreshCompleted();
              },
              // onLoading: () async {
              //   await activityData.loadMoreData();
              //   _refreshController.loadComplete();
              // },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UsersScreen()));
                        },
                        child: Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.people,
                                  size: 40,
                                  color: primaryColor,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "${dashboardData.getDashboard?.users}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "USers",
                                  style: TextStyle(
                                    fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    color: secondaryColor
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CandidateScreen()));

                        },
                        child: Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.groups,
                                  size: 40,
                                  color: primaryColor,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "${dashboardData.getDashboard?.candidates}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Candidates",
                                  style: TextStyle(
                                    fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    color: secondaryColor
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.check_box_outlined,
                                size: 40,
                                color: primaryColor,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "${dashboardData.getDashboard?.votes}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Votes",
                                style: TextStyle(
                                  fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  color: secondaryColor
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ElectionScreen()));

                        },
                        child: Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.takeout_dining,
                                  size: 40,
                                  color: primaryColor,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "${dashboardData.getDashboard?.elections}",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Elections",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: secondaryColor
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },

        ),
      ),
    );
  }
}
