import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sovs/screens/login_screen.dart';

import '../utils/constants.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            child: SvgPicture.asset("assets/images/welcome.svg"),
          ),
          SizedBox(height: 10,),
          Text("Welcome to",style: TextStyle(color: primaryColor,fontSize: 25),),
          Text("Smart Vote",style: detailsStyleWithBoldWithPrimary,),
          SizedBox(height: 40,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.all(10),
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )
              ),
              onPressed: (){
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
              }, child: Text("Log in to account",style: normalStyleWithWhite,))
        ],
      ),
    );
  }
}
