import 'package:flutter/material.dart';
import 'package:sovs/screens/update_user_screen.dart';

import '../utils/constants.dart';

class UserDetailsScreen extends StatefulWidget {
  String fullname;
  String firstname;
  String lastname;
  String username;
  String uniqueId;
  String gender;
  String email;
  String phone;
  String course;
   UserDetailsScreen({required this.fullname,required this.firstname,required this.lastname,required this.username,required this.uniqueId,required this.gender,required this.email,required this.phone,required this.course,super.key});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {

  bool isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.fullname}",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),centerTitle: true,backgroundColor: primaryColor,iconTheme: IconThemeData(color: whiteColor)),
      body: Column(
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
                          child: Text("${widget.fullname}",
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
                              "Course :",
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
                                child: Text("${widget.course}",
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
                        "Gender :",
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
                          child: Text("${widget.gender}",
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
                              "E-mail :",
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
                                child: Text("${widget.email}",
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
                              "PhoneNumber :",
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
                                child: Text("${widget.phone}",
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
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(
          //     24.0,
          //     24.0,
          //     24.0,
          //     0,
          //   ),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: Container(
          //           width: MediaQuery.of(context).size.width *
          //               0.4,
          //           child: Row(
          //             children: [
          //               Expanded(
          //                   child: Text(
          //                     "Gender :",
          //                     overflow: TextOverflow.clip,
          //                     style: detailsStyleWithBold,
          //                   )),
          //             ],
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //         child: Container(
          //           width: MediaQuery.of(context).size.width *
          //               0.5,
          //           child: Row(
          //             children: [
          //               Expanded(
          //                   child: Container(
          //                     decoration: BoxDecoration(
          //                         borderRadius:
          //                         BorderRadius.circular(10)),
          //                     child: Padding(
          //                       padding:
          //                       const EdgeInsets.all(8.0),
          //                       child: Text("",
          //                         style: TextStyle(
          //                           //color: statusColor,
          //                             fontSize: 14,
          //                             fontFamily: "Poppins"),
          //                       ),
          //                     ),
          //                   )),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          SizedBox(height: 20,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.all(10),
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )
              ),
              onPressed: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>UpdateUserScreen(fullname: '${widget.fullname}',
                      uniqueId: '${widget.uniqueId}', gender: '${widget.lastname}', email: '${widget.email}',
                      phone: '${widget.phone}', course: '${widget.course}', firstname: '${widget.firstname}',
                      lastname: '${widget.lastname}', username: '${widget.username}',)));
              }, child: Text("Update User",style: TextStyle(color: whiteColor,fontSize: 16),)),
    ]
      ),
    );
  }
}
