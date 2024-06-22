import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/election_controller.dart';
import '../utils/constants.dart';
import 'add_election_screen.dart';
import 'election_details_screen.dart';

class ElectionScreen extends StatefulWidget {
  const ElectionScreen({super.key});

  @override
  State<ElectionScreen> createState() => _ElectionScreenState();
}

class _ElectionScreenState extends State<ElectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Election",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),centerTitle: true,backgroundColor: primaryColor,iconTheme: IconThemeData(color: whiteColor)),
      body: Column(
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddElectionScreen()));
                  }, child: Text("Add Election",style: TextStyle(color: Colors.white)))
            ],
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Consumer<GetAllElectionController>(
              builder: (context,electionData,_){
                // if (!loadedStakeholder) {
                //   stakeholderData.getProjectStakeholdersFunction(widget.projectUniqueId);
                //   print(stakeholderData.getProjectStakeholderList.length);
                //   loadedStakeholder = true;
                // }
                return electionData.dataLoading == true ? Center(child: CircularProgressIndicator(),) :
                electionData.getAllElection.isEmpty ? Center(child: Text("No stakeholder"),):
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: electionData.getAllElection.length,
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          Material(
                            elevation:4,
                            child: ListTile(
                              title:
                                Text(
                                    "Title: ${electionData.getAllElection[index].name}",
                                    // style: detailsStyle
                                ), subtitle: Text("Category: ${electionData.getAllElection[index].category}"),
                              trailing: IconButton(onPressed: (){},icon: Icon(Icons.delete),color: errorColor,),
                              onTap: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>
                                        ElectionDetailScreen(uniqueId: '${electionData.getAllElection[index].uuid}',
                                          title: '${electionData.getAllElection[index].name}',
                                          category: '${electionData.getAllElection[index].category}', year: '${electionData.getAllElection[index].year}', description: '${electionData.getAllElection[index].description}',)));
                              },
                            ),
                          ),
                        ],
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
