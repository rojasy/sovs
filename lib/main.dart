import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sovs/controllers/logged_in_user_controller.dart';
import '../screens/login_screen.dart';
import 'controllers/election_controller.dart';

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
      ],
      child: MaterialApp(
        title: 'Smart Voting System',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: LoginScreen(),
      ),
    );
  }
}


