import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sovs/controllers/logged_in_user_controller.dart';
import 'package:sovs/screens/coba_screen.dart';
import 'package:sovs/screens/coet_screen.dart';
import 'package:sovs/screens/presidential_screen.dart';
import 'package:sovs/screens/profile_screen.dart';
import 'package:sovs/screens/settings_screen.dart';
import 'package:sovs/utils/constants.dart';

import '../config/authentication.dart';
import '../controllers/election_controller.dart';
import '../models/logged_in_user_model.dart';
import 'collage_screen.dart';
import 'election_result_screen.dart';
import 'login_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  // bool isAdmin = false;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    ElectionResultScreen(),
    NotificationScreen(),
    SettingsScreen(),
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<GetLoggedInUserController>(context, listen: false).getLoggedInUserFunction();
    // showSettingsItem();
  }


  // Future<void> showSettingsItem() async {
  //   try {
  //     // Retrieve user data using Provider
  //     final userData = await Provider.of<GetLoggedInUserController>(context, listen: false).getLoggedInUserFunction();
  //
  //     // Check if user data is not null and has roles
  //     if (userData != null && userData.getLoggedInUser != null) {
  //       // Example assuming roles is a list of roles the user has
  //       List<Role> userRoles = userData.getLoggedInUser.roles;
  //
  //       print("userData.getLoggedInUser");
  //       print(userData.getLoggedInUser);
  //
  //       // Check if user has SUPER_ADMINISTRATOR role
  //       bool hasAdminRole = userRoles.any((role) => role.name == 'SUPER_ADMINISTRATOR');
  //
  //       setState(() {
  //         isAdmin = hasAdminRole;
  //         // isAdmin = true;
  //       });
  //     }
  //   } catch (error) {
  //     print('Error fetching user data: $error');
  //     // Handle error scenarios as needed
  //   }
  // }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {

        return Scaffold(
          body: _widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: Consumer<GetLoggedInUserController>(
            builder: (context,userData,_){
              return BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: primaryColor,
                  currentIndex: _selectedIndex,
                  onTap: _onItemTapped,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home",),
                    BottomNavigationBarItem(icon: Icon(Icons.book_outlined),label: "Election Results"),
                    BottomNavigationBarItem(icon: Icon(Icons.notifications),label: "Notification"),
                    // BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
                    if (userData.isAdmin) BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
                  ]);
            },
          ),
        );
      }
}


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String getInitials(String fullName) {
    List<String> nameParts = fullName.split(" ");
    String initials = "";
    for (var part in nameParts) {
      if (part.isNotEmpty) {
        initials += part[0];
      }
    }
    return initials;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Dashboard"),),
      backgroundColor: bgColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 60,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            await Oauth2Httprequest.logout();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));

                          },
                          child: CircleAvatar(
                            backgroundColor: secondaryColor,
                              child: Icon(Icons.logout_outlined,color: errorColor,))
                        ),
                        Expanded(child: SizedBox()),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProfileScreen()));

                          },
                          child: Consumer<GetLoggedInUserController>(
                            builder: (context,profileData,_){
                              String fullName = profileData.getLoggedUser?.fullName ?? "";
                              String initials = getInitials(fullName);
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CircleAvatar(
                                    // backgroundColor:primaryColor.withOpacity(0.5),
                                    child: Text("${initials}"),
                                  )
                                ],
                              );
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 50,),
                  Row(
                    children: [
                      Text("Welcome",style: TextStyle(color: whiteColor,fontSize: 40,fontFamily: "Poppins"),),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Let's Get Started",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),
                    ],
                  ),

                ],
              ),

            ),
          ),

          SizedBox(height: 40,),

          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PresidentialScrenn()));
            },
            child: Material(
              elevation: 4,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/images/uaut_logo.jpg"),
                          ),
                          Column(
                            children: [
                              Text("PRESIDENTIAL ELECTION",style: TextStyle(color: whiteColor,fontSize: 20,fontFamily: "Poppins"),),
                              SizedBox(height: 8,),
                              Text("UCHAGUZI WA MARAISI",style: TextStyle(color: secondaryColor,fontFamily: "Poppins"),),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 20,),

          InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CollagesScreen()));
            },
            child: Material(
              elevation: 4,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/images/uaut_logo.jpg"),
                          ),
                          Column(
                            children: [
                              Text("WABUNGE ELECTION",style: TextStyle(color: primaryColor,fontSize: 20,fontFamily: "Poppins"),),
                              SizedBox(height: 8,),
                              Text("UCHAGUZI WA WABUNGE COLLAGES",style: TextStyle(color: secondaryColor,fontFamily: "Poppins"),),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.only(top: 20.0,right: 20.0,left: 20.0),
          //   child: InkWell(
          //     onTap: (){
          //       Navigator.of(context).push(MaterialPageRoute(builder: (context) => PresidentialScrenn()));
          //     },
          //     child: Container(
          //       width: double.infinity,
          //       height: MediaQuery.of(context).size.height * 0.1,
          //       decoration: BoxDecoration(
          //           color: secondaryColor,
          //           borderRadius: BorderRadius.circular(20),
          //           border: Border.all(width: 0.3)
          //         // color: Colors.cyan
          //       ),
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 18.0),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text("Presidential",style: TextStyle(color: textColor)),
          //             // SizedBox(width: 10,),
          //             const Expanded(child: SizedBox()),
          //             Text("",style: TextStyle(color: textColor,fontSize: 18),),
          //
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 20.0,right: 20.0,left: 20.0),
          //   child: InkWell(
          //     onTap: (){
          //       Navigator.of(context).push(MaterialPageRoute(builder: (context) => CoetScreen()));
          //     },
          //     child: Container(
          //       width: double.infinity,
          //       height: MediaQuery.of(context).size.height * 0.1,
          //       decoration: BoxDecoration(
          //           color: secondaryColor,
          //           borderRadius: BorderRadius.circular(20),
          //           border: Border.all(width: 0.3)
          //         // color: Colors.cyan
          //       ),
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 18.0),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text("COET PARLIAMENT",style: TextStyle(color: textColor)),
          //             // SizedBox(width: 10,),
          //             const Expanded(child: SizedBox()),
          //             Text("",style: TextStyle(color: textColor,fontSize: 18),),
          //
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 20.0,right: 20.0,left: 20.0),
          //   child: InkWell(
          //     onTap: (){
          //       Navigator.of(context).push(MaterialPageRoute(builder: (context) => CobaScreen()));
          //     },
          //     child: Container(
          //       width: double.infinity,
          //       height: MediaQuery.of(context).size.height * 0.1,
          //       decoration: BoxDecoration(
          //           color: secondaryColor,
          //           borderRadius: BorderRadius.circular(20),
          //           border: Border.all(width: 0.3)
          //         // color: Colors.cyan
          //       ),
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 18.0),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Text("COBA PARLIAMENT",style: TextStyle(color: textColor)),
          //             // SizedBox(width: 10,),
          //             const Expanded(child: SizedBox()),
          //             Text("",style: TextStyle(color: textColor,fontSize: 18),),
          //
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
