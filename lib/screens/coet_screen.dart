import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../controllers/candidate_controller.dart';
import '../utils/constants.dart';

class CoetScreen extends StatefulWidget {
  const CoetScreen({super.key});

  @override
  State<CoetScreen> createState() => _CoetScreenState();
}

class _CoetScreenState extends State<CoetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("COET Parliaments",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),centerTitle: true,backgroundColor: primaryColor,iconTheme: IconThemeData(color: whiteColor)),

      body: Consumer<CandidateController>(
        builder: (context,candidateData,_){
          return candidateData.dataLoading == true ? Center(child: CircularProgressIndicator(),) :
          candidateData.getAllCandidateByCategoryCOETList.isEmpty ? Center(child: Text("There is no Candidate for COET parliaments"),) :
          ListView.builder(
              itemCount: candidateData.getAllCandidateByCategoryCOETList.length,
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
                          Flexible(child: Text("Name: ${candidateData.getAllCandidateByCategoryCOETList[index].userAccount.fullName}",style: TextStyle(color: primaryColor,fontFamily: "Poppins"),)),
                          SizedBox(width: 10,),
                          Flexible(child: Text("${candidateData.getAllCandidateByCategoryCOETList[index].election.category}")),
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
                                  title: Text("Vote",style: TextStyle(color: primaryColor,fontFamily: "Poppins",fontSize: 20),),
                                  content: Text("Click YES! To Vote"),
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
                        }, icon: Icon(Icons.add_box_outlined,color: primaryColor,)),
                      ],
                    )
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
