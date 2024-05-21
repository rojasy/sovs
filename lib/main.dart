import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sovs/controllers/logged_in_user_controller.dart';
import 'package:sovs/screens/welcome_screen.dart';
import '../screens/login_screen.dart';
import 'controllers/candidate_controller.dart';
import 'controllers/election_controller.dart';
import 'controllers/users_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GetLoggedInUserController()),
        ChangeNotifierProvider(create: (context) => GetAllElectionController()),
        ChangeNotifierProvider(create: (context) => CandidateController()),
        ChangeNotifierProvider(create: (context) => GetUsersController()),
      ],
      child: MaterialApp(
        title: 'Smart Voting System',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}


