import 'package:flutter/material.dart';
import 'package:sovs/screens/update_candidate_screen.dart';

import '../utils/constants.dart';

class CandidateDetailsScreen extends StatefulWidget {
  String title;
  String description;
  String name;
  String uuid;
  String userUuid;
  String electionUuid;
   CandidateDetailsScreen({required this.title,required this.name,
     required this.description,required this.uuid,required this.userUuid,required this.electionUuid,super.key});

  @override
  State<CandidateDetailsScreen> createState() => _CandidateDetailsScreenState();
}

class _CandidateDetailsScreenState extends State<CandidateDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Candidate Details",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),centerTitle: true,backgroundColor: primaryColor,iconTheme: IconThemeData(color: whiteColor)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              24.0,
              24.0,
              24.0,
              0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.4,
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                              "Candidate :",
                              overflow: TextOverflow.clip,
                              style: detailsStyleWithBold,
                            )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.5,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              child: Padding(
                                padding:
                                const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.name,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              24.0,
              24.0,
              24.0,
              0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.4,
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                              "Policy Title :",
                              overflow: TextOverflow.clip,
                              style: detailsStyleWithBold,
                            )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.5,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              child: Padding(
                                padding:
                                const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.title,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              24.0,
              24.0,
              24.0,
              0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.4,
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                              "Policy Summary :",
                              overflow: TextOverflow.clip,
                              style: detailsStyleWithBold,
                            )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.5,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              child: Padding(
                                padding:
                                const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.description,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.all(10),
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )
              ),
              onPressed: (){

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>
                        UpdateCandidateScreen(title: '${widget.title}', description: '${widget.description}',
                          name: '${widget.name}', uuid: '${widget.uuid}', userUuid: '${widget.userUuid}', electionUuid: '${widget.electionUuid}',)));

              }, child: Text("Update Candidate",style: TextStyle(color: whiteColor,fontSize: 16),)),
        ],
      ),
    );
  }
}
