// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:academy_app/constants.dart';
import 'package:academy_app/screens/auth_screen_private.dart';
import 'package:flutter/material.dart';
import '../providers/shared_pref_helper.dart';
import 'tabs_screen.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  dynamic courseAccessibility;

  systemSettings() async {
    var url = "$BASE_URL/api/system_settings";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        courseAccessibility = data['course_accessibility'];
      });
    } else {
      setState(() {
        courseAccessibility = '';
      });
    }
  }

  @override
  void initState() {
    donLogin();
    systemSettings();
    super.initState();
  }

  void donLogin() {
    String? token;
    Future.delayed(const Duration(seconds: 3), () async {
      token = await SharedPreferenceHelper().getAuthToken();
      if (token != null && token!.isNotEmpty) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const TabsScreen()));
      } else {
        if (courseAccessibility == 'publicly') {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const TabsScreen()));
        } else {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const AuthScreenPrivate()));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: kBackgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            SizedBox(
                height: MediaQuery.of(context).size.height*0.5,
                child:
                Center(child:
                Image.asset( 'assets/images/appLogo.png',
                  fit: BoxFit.cover,
                ),)),

            // SizedBox(
            //   height: 100.h,),
            // Expanded(
            //   child: Center(
            //     child: listOfAnimations.first.widget,
            //   ),
            // ),
            Expanded(child: Container()),
          ],
        ),


      );

    // Scaffold(
    //   backgroundColor: kBackgroundColor,
    //   body: Center(
    //     child: SizedBox(
    //       // height: MediaQuery.of(context).size.height,
    //       // width: double.infinity,
    //       child: Image.asset(
    //         'assets/images/appLogo.png',
    //         fit: BoxFit.cover,
    //       ),
    //     ),
    //   ),
    // );
  }
}
