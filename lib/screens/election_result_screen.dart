import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ElectionResultScreen extends StatefulWidget {
  const ElectionResultScreen({super.key});

  @override
  State<ElectionResultScreen> createState() => _ElectionResultScreenState();
}

class _ElectionResultScreenState extends State<ElectionResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Election Results",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),centerTitle: true,backgroundColor: primaryColor,iconTheme: IconThemeData(color: whiteColor)),
   body: Column(
     children: [
       Material(
         elevation: 3,
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(
                 children: [
                   Text("Name: Yusuph Jumbe",style: TextStyle(color: primaryColor,fontFamily: "Poppins"),),
                   SizedBox(width: 10,),
                   Text("COET"),
                 ],
               ),
               Row(
                 children: [
                   Text("230",style: TextStyle(color: primaryColor,fontFamily: "Poppins",fontSize: 30),)
                 ],
               )
             ],
           ),
         ),
       )
     ],
   ),
    );
  }
}
