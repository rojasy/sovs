import 'package:flutter/material.dart';

import '../utils/constants.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Users"),backgroundColor: primaryColor,iconTheme: IconThemeData(color: Colors.white),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProjectReportingScreen()));
                    }, child: Text("Add User",style: TextStyle(color: Colors.white)))
              ],
            ),
            SizedBox(height: 10,),
            
          ],
        ),
      ),
    );
  }
}
