import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/candidate_controller.dart';
import '../utils/constants.dart';

class CobaScreen extends StatefulWidget {
  const CobaScreen({super.key});

  @override
  State<CobaScreen> createState() => _CobaScreenState();
}

class _CobaScreenState extends State<CobaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("COBA Parliaments"),),
      body: Consumer<CandidateController>(
        builder: (context,candidateData,_){
          return ListView.builder(
              itemCount: candidateData.getAllCandidateByCategoryCOBAList.length,
              itemBuilder: (context,index){
                return candidateData.dataLoading == true ? Center(child: CircularProgressIndicator(),) :
                candidateData.getAllCandidateByCategoryCOBAList.isEmpty ? Center(child: Text("There is no Candidate for COBA parliaments"),) :
                Material(
                  elevation: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(candidateData.getAllCandidateByCategoryCOBAList[index].userAccount.fullName),
                      Text(candidateData.getAllCandidateByCategoryCOBAList[index].election.category),
                      Text(candidateData.getAllCandidateByCategoryCOBAList[index].title),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              padding: EdgeInsets.all(10),
                              minimumSize: Size(MediaQuery.of(context).size.width * 0.1, 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              )
                          ),
                          onPressed: (){}, child: Text("Vote",style: TextStyle(color: Colors.white),)),
                    ],
                  ),
                );
              });

        },
      ),
    );
  }
}
