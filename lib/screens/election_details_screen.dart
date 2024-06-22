import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ElectionDetailScreen extends StatefulWidget {
  String title;
  String uniqueId;
  String category;
  String description;
  String year;
   ElectionDetailScreen({required this.uniqueId,required this.title,required this.category,required this.description,required this.year,super.key});

  @override
  State<ElectionDetailScreen> createState() => _ElectionDetailScreenState();
}

class _ElectionDetailScreenState extends State<ElectionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Election Details",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),centerTitle: true,backgroundColor: primaryColor,iconTheme: IconThemeData(color: whiteColor)),
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
                              "Title :",
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
                              "Description :",
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
                              "Category :",
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
                                  widget.category,
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
                              "Year :",
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
                                  widget.year,
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
              onPressed: (){}, child: Text("Update Election",style: TextStyle(color: whiteColor,fontSize: 16),)),
        ],
      ),
    );
  }
}
