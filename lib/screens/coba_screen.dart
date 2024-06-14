import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/candidate_controller.dart';
import '../utils/constants.dart';
import 'candidate_details_screen.dart';

class CobaScreen extends StatefulWidget {
  const CobaScreen({super.key});

  @override
  State<CobaScreen> createState() => _CobaScreenState();
}

class _CobaScreenState extends State<CobaScreen> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: Text("Voting")),
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
      appBar: AppBar(title: Text("COBA Parliaments",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),centerTitle: true,backgroundColor: primaryColor,iconTheme: IconThemeData(color: whiteColor)),

      body: Consumer<CandidateController>(
        builder: (context,candidateData,_){
          return candidateData.dataLoading == true ? Center(child: CircularProgressIndicator(),) :
          candidateData.getAllCandidateByCategoryCOBAList.isEmpty ? Center(child: Text("There is no Candidate for COBA parliaments"),) :
          SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            enablePullUp: true,
            onRefresh: () async {
              await candidateData.refreshCOBAData();
              _refreshController.refreshCompleted();
            },
            // onLoading: () async {
            //   await activityData.loadMoreData();
            //   _refreshController.loadComplete();
            // },
            child: ListView.builder(
                itemCount: candidateData.getAllCandidateByCategoryCOBAList.length,
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
                            Flexible(child: Text("${candidateData.getAllCandidateByCategoryCOBAList[index].userAccount.fullName}",style: TextStyle(color: primaryColor,fontFamily: "Poppins"),)),
                            SizedBox(width: 10,),
                            Flexible(child: Text("${candidateData.getAllCandidateByCategoryCOBAList[index].election.category}")),
                            SizedBox(width: 10,),
                            Flexible(child: Text("${candidateData.getAllCandidateByCategoryCOBAList[index].totalVotes == null ? 0 : candidateData.getAllCandidateByCategoryCOBAList[index].totalVotes }",style: TextStyle(fontSize: 20),)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(onPressed: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>
                                    CandidateDetailsScreen(title: '${candidateData.getAllCandidateByCategoryCOBAList[index].title}',
                                      name: '${candidateData.getAllCandidateByCategoryCOBAList[index].userAccount.fullName}',
                                      description: '${candidateData.getAllCandidateByCategoryCOBAList[index].description}',)));
                          }, icon: Icon(Icons.visibility)),
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
                                          onPressed: () async {

                                            showLoaderDialog(context);

                                            Map<String,dynamic>? output = await Provider.of<CandidateController>(context,listen: false).
                                            addVote(context, candidateData.getAllCandidateByCategoryList[index].uuid, candidateData.getAllCandidateByCategoryList[index].election.uuid, 2024);

                                            String message = output?['addVote']['message'];
                                            bool status = output?['addVote']['error'];

                                            if(status == false){
                                              Navigator.of(context).pop();
                                              ScaffoldMessenger.of(
                                                  context)
                                                  .showSnackBar(
                                                  SnackBar(content: Text(message),backgroundColor: successColor,));
                                              Navigator.of(
                                                  context)
                                                  .pop();

                                            }else{
                                              Navigator.of(context).pop();
                                              ScaffoldMessenger.of(
                                                  context)
                                                  .showSnackBar(
                                                  SnackBar(content: Text(message),backgroundColor: errorColor,));
                                              Navigator.of(
                                                  context)
                                                  .pop();
                                            }

                                          }, child: Text("Yes",style: TextStyle(color: whiteColor),)),

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
            }),
          );
        },
      ),
    );
  }
}
