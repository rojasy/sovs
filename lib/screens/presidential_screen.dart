import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


import '../controllers/candidate_controller.dart';
import '../controllers/election_controller.dart';
import '../utils/constants.dart';
import 'candidate_details_screen.dart';

class PresidentialScrenn extends StatefulWidget {
  const PresidentialScrenn({super.key});

  @override
  State<PresidentialScrenn> createState() => _PresidentialScrennState();
}

class _PresidentialScrennState extends State<PresidentialScrenn> {

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
      appBar: AppBar(title: Text("Presidents",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),centerTitle: true,backgroundColor: primaryColor,iconTheme: IconThemeData(color: whiteColor)),

      body: Consumer<CandidateController>(
        builder: (context,candidateData,_){
          return candidateData.dataLoading == true ? Center(child: CircularProgressIndicator(),) :
          candidateData.getAllCandidateByCategoryList.isEmpty ? Center(child: Text("There is no Candidate for Presidential"),) :
          SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            enablePullUp: true,
            onRefresh: () async {
              await candidateData.refreshPresidentData();
              _refreshController.refreshCompleted();
            },
            // onLoading: () async {
            //   await activityData.loadMoreData();
            //   _refreshController.loadComplete();
            // },
            child: ListView.builder(
              itemCount: candidateData.getAllCandidateByCategoryList.length,
                itemBuilder: (context,index){
                print(candidateData.getAllCandidateByCategoryList[index].totalVotes );
                  final totalVotes = candidateData.getAllCandidateByCategoryList[index]?.totalVotes ?? 0;
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
                            Flexible(child: Text("Name: ${candidateData.getAllCandidateByCategoryList[index].userAccount.fullName}",style: TextStyle(color: primaryColor,fontFamily: "Poppins"),)),
                            SizedBox(width: 10,),
                            Flexible(child: Text("${candidateData.getAllCandidateByCategoryList[index].election.category}")),
                            SizedBox(width: 10,),
                            Flexible(child: Text("${candidateData.getAllCandidateByCategoryList[index].totalVotes == null ? 0 : candidateData.getAllCandidateByCategoryList[index].totalVotes}",style: TextStyle(fontSize: 20),)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(onPressed: (){
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context)=>
                                    CandidateDetailsScreen(title: '${candidateData.getAllCandidateByCategoryList[index].title}',
                                      name: '${candidateData.getAllCandidateByCategoryList[index].userAccount.fullName}',
                                      description: '${candidateData.getAllCandidateByCategoryList[index].description}',)));
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
