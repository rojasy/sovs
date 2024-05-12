import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/election_controller.dart';

class PresidentialScrenn extends StatefulWidget {
  const PresidentialScrenn({super.key});

  @override
  State<PresidentialScrenn> createState() => _PresidentialScrennState();
}

class _PresidentialScrennState extends State<PresidentialScrenn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<GetAllElectionController>(
        builder: (context,electionData,_){
          return ListView.builder(
              itemCount: electionData.getAllElection.length,
              itemBuilder: (context,index){
                return electionData.dataLoading == true ? Center(child: CircularProgressIndicator(),) :
                electionData.getAllElection.isEmpty ? Center(child: Text("There is no election"),) :
                Column(
                  children: [
                    Text(electionData.getAllElection[index].category),
                  ],
                );
              });

        },
      ),
    );
  }
}
