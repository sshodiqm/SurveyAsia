import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survei_asia/screens/login.dart';
import 'package:survei_asia/screens/main_screens.dart';
import 'package:survei_asia/screens/onboarding.dart';
import 'dart:async';

import 'package:survei_asia/services/shared_service.dart';

class LauncherPage extends StatefulWidget {
  @override
  _LauncherPageState createState() => new _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    super.initState();
    startLaunching();
  }

  startLaunching() async {
    var duration = const Duration(milliseconds: 1000);
    return Timer(duration, () {
      checkOnBoardingAndLogin();
    });
  }

  void checkOnBoardingAndLogin() async {
    var onboardingStatus = await SharedService.checkOnBoarding();
    var loginStatus = await SharedService.isLoggedIn();
    print("Status view OnBoarding : $onboardingStatus");
    if (onboardingStatus) {
      if (loginStatus) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreens(),
            ),
            (route) => false);
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
            (route) => false);
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.white])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset(
                "images/image1.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// import 'dart:js';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'dart:async';
// import './landing.dart';
//
// class LauncherPage extends StatefulWidget {
//   @override
//   void initState() {
//     super.initState();
//     startLaunching();
//   }
//   startLaunching() async {
//     var duration = const Duration(seconds: 10);
//     return new Timer(duration, () {
//       Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (_){
//         return new LandingPage();
//       }));
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Color(0xfffbb448),
//     ));
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(5)),
//           boxShadow: <BoxShadow>[
//             BoxShadow(
//               color: Colors.grey.shade200,
//               offset: Offset(2, 4),
//               blurRadius: 5,
//               spreadRadius: 2
//             )
//           ],
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Color(0xfffbb448), Color(0xfff7892b)])),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             new Center(
//               child: new Image.asset(
//                 'images/image1.png',
//                 height: 70.0,
//                 width: 200.0,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }