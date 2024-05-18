import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sovs/controllers/logged_in_user_controller.dart';
import 'package:sovs/screens/coba_screen.dart';
import 'package:sovs/screens/coet_screen.dart';
import 'package:sovs/screens/presidential_screen.dart';
import 'package:sovs/utils/constants.dart';

import '../controllers/election_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard"),),
      backgroundColor: bgColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0,right: 20.0,left: 20.0),
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PresidentialScrenn()));
              },
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 0.3)
                  // color: Colors.cyan
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Presidential",style: TextStyle(color: textColor)),
                      // SizedBox(width: 10,),
                      const Expanded(child: SizedBox()),
                      Text("",style: TextStyle(color: textColor,fontSize: 18),),

                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0,right: 20.0,left: 20.0),
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CoetScreen()));
              },
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 0.3)
                  // color: Colors.cyan
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("COET PARLIAMENT",style: TextStyle(color: textColor)),
                      // SizedBox(width: 10,),
                      const Expanded(child: SizedBox()),
                      Text("",style: TextStyle(color: textColor,fontSize: 18),),

                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0,right: 20.0,left: 20.0),
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CobaScreen()));
              },
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 0.3)
                  // color: Colors.cyan
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("COBA PARLIAMENT",style: TextStyle(color: textColor)),
                      // SizedBox(width: 10,),
                      const Expanded(child: SizedBox()),
                      Text("",style: TextStyle(color: textColor,fontSize: 18),),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
