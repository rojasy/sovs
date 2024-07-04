import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/candidate_controller.dart';
import '../utils/constants.dart';

class ElectionResultScreen extends StatefulWidget {
  const ElectionResultScreen({super.key});

  @override
  State<ElectionResultScreen> createState() => _ElectionResultScreenState();
}

class _ElectionResultScreenState extends State<ElectionResultScreen> {

  final RefreshController _refreshController = RefreshController(initialRefresh: false);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Election Results",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),centerTitle: true,backgroundColor: primaryColor,iconTheme: IconThemeData(color: whiteColor)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
             children: [

         Row(
           children: [
             Text("Presidentials",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
           ],
         ),
               SizedBox(height: 10),
         Expanded(
           child: Container(
             width: MediaQuery.of(context).size.width,
             child: Consumer<CandidateController>(builder: (context,presidentData,_){
               return presidentData.dataLoading == true ? Center(child: CircularProgressIndicator(),) :
               presidentData.getAllCandidateByCategoryList.isEmpty ? Center(child: Text("There is no Candidate for Presidential"),) : ListView.builder(
                 shrinkWrap: true,
                 itemCount: presidentData.getAllCandidateByCategoryList.length,
                   itemBuilder: (context,index){
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Material(
                     elevation: 3,
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         children: [
                           Text("${presidentData.getAllCandidateByCategoryList[index].userAccount.fullName}"),
                           Expanded(child: SizedBox()),
                           Text("${presidentData.getAllCandidateByCategoryList[index].totalVotes}")
                         ],
                       ),
                     ),
                   ),
                 );
               });
             }),
           ),
         ),
               SizedBox(height: 20),

         Row(
           children: [
             Text("COET Result",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
           ],
         ),
               SizedBox(height: 10),
         Expanded(
           child: Container(
             width: MediaQuery.of(context).size.width,
             child: Consumer<CandidateController>(builder: (context,coetData,_){
               return coetData.dataLoading == true ? Center(child: CircularProgressIndicator(),) :
               coetData.getAllCandidateByCategoryCOETList.isEmpty ? Center(child: Text("There is no Candidate for COET"),) : ListView.builder(
                 shrinkWrap: true,
                   itemCount: coetData.getAllCandidateByCategoryCOETList.length,
                   itemBuilder: (context,index){
                     return Padding(
                       padding: const EdgeInsets.all(5.0),
                       child: Material(
                         elevation: 3,
                         child: Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: Row(
                             children: [
                               Text("${coetData.getAllCandidateByCategoryCOETList[index].userAccount.fullName}"),
                               Expanded(child: SizedBox()),
                               Text("${coetData.getAllCandidateByCategoryCOETList[index].totalVotes}")
                             ],
                           ),
                         ),
                       ),
                     );
                   });
             }),
           ),
         ),

               SizedBox(height: 20),
         Row(
           children: [
             Text("COBA Result",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
           ],
         ),
               SizedBox(height: 10),
         Expanded(
           child: Container(
             width: MediaQuery.of(context).size.width,
             child: Consumer<CandidateController>(builder: (context,cobaData,_){
               return cobaData.dataLoading == true ? Center(child: CircularProgressIndicator(),) :
               cobaData.getAllCandidateByCategoryCOBAList.isEmpty ? Center(child: Text("There is no Candidate for COBA"),) :
               ListView.builder(
                 shrinkWrap: true,
                   itemCount: cobaData.getAllCandidateByCategoryCOBAList.length,
                   itemBuilder: (context,index){
                     return Padding(
                       padding: const EdgeInsets.all(5.0),
                       child: Material(
                         elevation: 3,
                         child: Padding(
                           padding: const EdgeInsets.all(10.0),
                           child: Row(
                             children: [
                               Text("${cobaData.getAllCandidateByCategoryCOBAList[index].userAccount.fullName}"),
                               Expanded(child: SizedBox()),
                               Text("${cobaData.getAllCandidateByCategoryCOBAList[index].totalVotes}")
                             ],
                           ),
                         ),
                       ),
                     );
                   });
             }),
           ),
         ),

             ],
           ),
      ),
    );
  }
}
