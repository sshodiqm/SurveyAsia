import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:survei_asia/screens/launcher.dart';
import 'package:survei_asia/screens/login.dart';
import 'package:survei_asia/screens/main_screens.dart';
import 'package:survei_asia/screens/onboarding.dart';
import 'firebase_options.dart';

// late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // name: 'SurveyAsia',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Survey Asia',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: LauncherPage(),
      initialRoute: '/launcher',
      routes: {
        '/launcher': (context) => LauncherPage(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/mainscreen': (context) => const MainScreens()
      },
    );
  }
}
