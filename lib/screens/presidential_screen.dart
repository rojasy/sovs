import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/candidate_controller.dart';
import '../controllers/election_controller.dart';
import '../utils/constants.dart';

class PresidentialScrenn extends StatefulWidget {
  const PresidentialScrenn({super.key});

  @override
  State<PresidentialScrenn> createState() => _PresidentialScrennState();
}

class _PresidentialScrennState extends State<PresidentialScrenn> {

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: Text("Loging in")),
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
      appBar: AppBar(title: Text("Presidents"),),
      body: Consumer<CandidateController>(
        builder: (context,candidateData,_){
          return ListView.builder(
              itemCount: candidateData.getAllCandidateByCategoryList.length,
              itemBuilder: (context,index){
                return candidateData.dataLoading == true ? Center(child: CircularProgressIndicator(),) :
                candidateData.getAllCandidateByCategoryList.isEmpty ? Center(child: Text("There is no Candidate for presidential"),) :
                Material(
                  elevation: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(candidateData.getAllCandidateByCategoryList[index].userAccount.fullName),
                      Text(candidateData.getAllCandidateByCategoryList[index].election.category),
                      Text(candidateData.getAllCandidateByCategoryList[index].title),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              padding: EdgeInsets.all(10),
                              minimumSize: Size(MediaQuery.of(context).size.width * 0.1, 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              )
                          ),
                          onPressed: ()async{

                            showLoaderDialog(context);

                            Map<String, dynamic>? output = await Provider.of<CandidateController>(context, listen: false).
                            addVote(context, candidateData.getAllCandidateByCategoryList[index].uuid, candidateData.getAllCandidateByCategoryList[index].election.uuid, 2024);


                            String message = output?['addVote']['message'];
                            bool error = output?['addVote']['error'];

                            if(error == false){
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(
                                  context)
                                  .showSnackBar(
                                  SnackBar(content: Text(message)));
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

                          }, child: Text("Vote",style: TextStyle(color: Colors.white),)),
                    ],
                  ),
                );
              });

        },
      ),
    );
  }
}
