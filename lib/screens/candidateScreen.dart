import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sovs/controllers/candidate_controller.dart';

import '../controllers/users_controller.dart';
import '../models/get_all_users_model.dart';
import '../utils/constants.dart';
import 'add_candidate_screen.dart';

class CandidateScreen extends StatefulWidget {
  const CandidateScreen({super.key});

  @override
  State<CandidateScreen> createState() => _CandidateScreenState();
}

class _CandidateScreenState extends State<CandidateScreen> {

  String userValue = "";
  String categoryValue = "";

  TextEditingController searchController = TextEditingController();

  ScrollController scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Candidates",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),centerTitle: true,backgroundColor: primaryColor,iconTheme: IconThemeData(color: whiteColor)),
      body:  Column(
        children: [
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: EdgeInsets.all(10),
                      minimumSize: Size(MediaQuery.of(context).size.width * 0.4, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      )
                  ),
                  onPressed: (){

                    // showModalBottomSheet(
                    //     context: context,
                    //     builder: (BuildContext context){
                    //       return SingleChildScrollView(
                    //         controller: scrollController,
                    //         child: Padding(
                    //           padding: const EdgeInsets.all(18.0),
                    //           child: Container(
                    //             width: double.infinity,
                    //             height: MediaQuery.of(context).size.height * 0.5,
                    //             child: Column(
                    //               children: [
                    //                 SizedBox(height: 30,),
                    //                 Text("Add Candidate",style: detailsStyleWithPrimary,),
                    //                 SizedBox(height: 25,),
                    //                 Consumer<GetUsersController>(
                    //                   builder: (context, usersData, __) {
                    //                     return _buildDropdownUsersButton(usersData.getAllUser);
                    //                   },
                    //                 ),
                    //                 SizedBox(height: 20,),
                    //                 _buildDropdownElectionCategoryButton(ElectionCategory.values),
                    //                 SizedBox(height: 20,),
                    //                 Row(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   children: [
                    //                     ElevatedButton(
                    //                         style: ElevatedButton.styleFrom(
                    //                             backgroundColor: errorColor,
                    //                             padding: EdgeInsets.all(10),
                    //                             minimumSize: Size(MediaQuery.of(context).size.width * 0.3, 50),
                    //                             shape: RoundedRectangleBorder(
                    //                               borderRadius: BorderRadius.all(Radius.circular(10)),
                    //                             )
                    //                         ),
                    //                         onPressed: (){
                    //                           Navigator.of(context).pop();
                    //                         }, child: Text("CLOSE",style: normalStyleWithWhite)),
                    //                     SizedBox(width: 10,),
                    //                     ElevatedButton(
                    //                         style: ElevatedButton.styleFrom(
                    //                             backgroundColor: primaryColor,
                    //                             padding: EdgeInsets.all(10),
                    //                             minimumSize: Size(MediaQuery.of(context).size.width * 0.3, 50),
                    //                             shape: RoundedRectangleBorder(
                    //                               borderRadius: BorderRadius.all(Radius.circular(10)),
                    //                             )
                    //                         ),
                    //                         onPressed: ()async{
                    //                           //
                    //                           // Map<String, dynamic>? output = await Provider.of<GetProjectsController>(context, listen: false).
                    //                           // createProjectMembers(context, userValue, memberRoleValue);
                    //                           //
                    //                           // String message = output?['createProjectMemberMutation']['response']['message'];
                    //                           // bool status = output?['createProjectMemberMutation']['response']['status'];
                    //                           //
                    //                           // if(status == true){
                    //                           //   ScaffoldMessenger.of(
                    //                           //       context)
                    //                           //       .showSnackBar(
                    //                           //       SnackBar(content: Text(message)));
                    //                           //   Navigator.of(
                    //                           //       context)
                    //                           //       .pop();
                    //                           //
                    //                           // }else{
                    //                           //   ScaffoldMessenger.of(
                    //                           //       context)
                    //                           //       .showSnackBar(
                    //                           //       SnackBar(content: Text(message),backgroundColor: errorColor,));
                    //                           //   Navigator.of(
                    //                           //       context)
                    //                           //       .pop();
                    //                           // }
                    //
                    //                         }, child: Text("SAVE",style: normalStyleWithWhite)),
                    //                   ],
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       );
                    //     });

                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddCandidateScreen()));
                  }, child: Text("Add Candidate",style: TextStyle(color: Colors.white)))
            ],
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<CandidateController>(
              builder: (context,candidateData,_){
                return candidateData.dataLoading == true ? Center(child: CircularProgressIndicator(),) :
                candidateData.getAllCandidatesList.isEmpty ? Center(child: Text("No Candidate available"),):
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    itemCount: candidateData.getAllCandidatesList.length,
                    itemBuilder: (context,index){
                  return Material(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Flexible(child: Text("Name: ${candidateData.getAllCandidatesList[index].userAccount.fullName}",overflow: TextOverflow.clip,style: TextStyle(color: primaryColor,fontFamily: "Poppins"),)),
                                SizedBox(width: 10,),
                                Flexible(child: Text("${candidateData.getAllCandidatesList[index].election.category}")),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.visibility)),
                              IconButton(onPressed: (){
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context){
                                      return AlertDialog(
                                        title: Text("Remove Candidate",style: TextStyle(color: primaryColor,fontFamily: "Poppins",fontSize: 20),),
                                        content: Text("Click YES! To Remove as Candidate"),
                                        actions: [
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: errorColor,
                                                  padding: EdgeInsets.all(10),
                                                  minimumSize: Size(MediaQuery.of(context).size.width * 0.2, 50),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  )
                                              ),
                                              onPressed: (){
                                                Navigator.of(context).pop();
                                              }, child: Text("No",style: TextStyle(color: whiteColor),)),
                                          ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: secondaryColor,
                                                  padding: EdgeInsets.all(10),
                                                  minimumSize: Size(MediaQuery.of(context).size.width * 0.2, 50),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  )
                                              ),
                                              onPressed: (){}, child: Text("Yes",style: TextStyle(color: whiteColor),)),

                                        ],
                                      );
                                    });
                              }, icon: Icon(Icons.delete,color: errorColor,)),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                });
              },
            ),
          ),
        ],
      ),
    );
  }



}



