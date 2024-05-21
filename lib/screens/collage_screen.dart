import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'coba_screen.dart';
import 'coet_screen.dart';

class CollagesScreen extends StatefulWidget {
  const CollagesScreen({super.key});

  @override
  State<CollagesScreen> createState() => _CollagesScreenState();
}

class _CollagesScreenState extends State<CollagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Collages",style: TextStyle(color: whiteColor,fontFamily: "Poppins"),),centerTitle: true,backgroundColor: primaryColor,iconTheme: IconThemeData(color: whiteColor)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Material(
              elevation: 3,
                child: ListTile(title: Text("COET(Collage of engineering)"),trailing: Icon(Icons.arrow_right_alt_rounded),onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CoetScreen()));

                },)),

            SizedBox(height: 20,),

            Material(
                elevation: 3,
                child: ListTile(title: Text("COBA(Collage of Business)"),trailing: Icon(Icons.arrow_right_alt_rounded),onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CobaScreen()));

                },)),
          ],
        ),
      ),
    );
  }
}
