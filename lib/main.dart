import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:madprojectlinkupapplication/pages/chatai.dart';
import 'package:madprojectlinkupapplication/pages/home.dart';
import 'package:madprojectlinkupapplication/pages/signin.dart';
import 'package:madprojectlinkupapplication/pages/signup.dart';
import 'package:madprojectlinkupapplication/service/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Link UP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder(
            future: AuthMethods().getcurrentUser(),
            builder: (context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                return Home();
              } else {
                return Signup();
              }
            }));
  }
}
