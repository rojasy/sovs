import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/logged_in_user_controller.dart';
import '../utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),centerTitle: true,backgroundColor: primaryColor,iconTheme: IconThemeData(color: whiteColor)),
      body: Consumer<GetLoggedInUserController>(
        builder: (context,profileData,_){
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  24.0,
                  24.0,
                  24.0,
                  0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width *
                            0.4,
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                                  "FullName :",
                                  overflow: TextOverflow.clip,
                                  style: detailsStyleWithBold,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width *
                            0.5,
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Text("${profileData.getLoggedUser?.fullName}",
                                      style: TextStyle(
                                        //color: statusColor,
                                          fontSize: 14,
                                          fontFamily: "Poppins"),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  24.0,
                  24.0,
                  24.0,
                  0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width *
                            0.4,
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                                  "Username :",
                                  overflow: TextOverflow.clip,
                                  style: detailsStyleWithBold,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width *
                            0.5,
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Text("${profileData.getLoggedUser?.username}",
                                      style: TextStyle(
                                        //color: statusColor,
                                          fontSize: 14,
                                          fontFamily: "Poppins"),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  24.0,
                  24.0,
                  24.0,
                  0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width *
                            0.4,
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                                  "Email :",
                                  overflow: TextOverflow.clip,
                                  style: detailsStyleWithBold,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width *
                            0.5,
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Text("${profileData.getLoggedUser?.email}",
                                      style: TextStyle(
                                        //color: statusColor,
                                          fontSize: 14,
                                          fontFamily: "Poppins"),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  24.0,
                  24.0,
                  24.0,
                  0,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width *
                            0.4,
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                                  "Phone :",
                                  overflow: TextOverflow.clip,
                                  style: detailsStyleWithBold,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width *
                            0.5,
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(10)),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(8.0),
                                    child: Text("${profileData.getLoggedUser?.phone}",
                                      style: TextStyle(
                                        //color: statusColor,
                                          fontSize: 14,
                                          fontFamily: "Poppins"),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },

      ),
    );
  }
}
