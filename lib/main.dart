// ignore_for_file: unused_import

import 'package:digital_ordering_system/auth/login_screen.dart';
import 'package:digital_ordering_system/config/colors.dart';
import 'package:digital_ordering_system/screens/home/home_screen.dart';
import 'package:digital_ordering_system/utils/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digital_ordering_system/controllers/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        )
      ],
      child: MaterialApp(
        title: 'Email and Password login',
        theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          hintColor: Colors.black,
        ),
        home: Constants.prefs?.getBool("loggedIn") == true ? const HomeScreen() : const LoginScreen(),
      ),
    );
  }
}
