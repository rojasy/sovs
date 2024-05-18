import 'package:flutter/material.dart';
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
      appBar: AppBar(title: Text("COET Parliaments"),),
      body: Consumer<CandidateController>(
        builder: (context,candidateData,_){
          return ListView.builder(
              itemCount: candidateData.getAllCandidateByCategoryCOETList.length,
              itemBuilder: (context,index){
                return candidateData.dataLoading == true ? Center(child: CircularProgressIndicator(),) :
                candidateData.getAllCandidateByCategoryCOETList.isEmpty ? Center(child: Text("There is no Candidate for Coet parliaments"),) :
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(candidateData.getAllCandidateByCategoryCOETList[index].userAccount.fullName),
                    Text(candidateData.getAllCandidateByCategoryCOETList[index].election.category),
                    Text(candidateData.getAllCandidateByCategoryCOETList[index].title),
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
                );
              });

        },
      ),
    );
  }
}
