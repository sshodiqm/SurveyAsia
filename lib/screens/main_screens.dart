import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survei_asia/res/theme.dart';
import 'package:survei_asia/screens/beranda.dart';
import 'package:survei_asia/screens/survey.dart';
import 'package:survei_asia/screens/profile.dart';
import '../models/response_model.dart';
import '../services/shared_service.dart';

class MainScreens extends StatefulWidget {
  final int? index;

  const MainScreens({
    super.key,
    this.index,
  });

  @override
  _MainScreens createState() => _MainScreens();
}

class _MainScreens extends State<MainScreens> {
  Data? loginResponse;

  int? pageIndex;

  @override
  void initState() {
    print("index sekarang : " + widget.index.toString());
    pageIndex = widget.index ?? 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pageList = [
      const BerandaScreen(),
      const SurveyScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      // body: pageList[pageIndex],
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
            FadeThroughTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: pageList[pageIndex!],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: pomegranate,
        currentIndex: pageIndex!,
        type: BottomNavigationBarType.fixed,
        onTap: ((value) {
          setState(() {
            pageIndex = value;
          });
        }),
        items: BottomNavigationItem,
      ),
    );
  }

  List<BottomNavigationBarItem> get BottomNavigationItem {
    return [
      BottomNavigationBarItem(
        label: 'Beranda',
        icon: Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: 'Survey',
        icon: SvgPicture.asset(
          'assets/svg/researcher.svg',
          color: Colors.grey[900],
        ),
        activeIcon: SvgPicture.asset(
          'assets/svg/researcher_active.svg',
          color: pomegranate,
        ),
      ),
      BottomNavigationBarItem(
        label: 'Profil',
        icon: Icon(CupertinoIcons.person_fill),
      ),
    ];
  }
}
