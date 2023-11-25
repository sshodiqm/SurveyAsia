import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survei_asia/screens/login.dart';
import 'package:survei_asia/screens/register.dart';

import '../res/theme.dart';
import '../services/shared_service.dart';
import '../widgets/line_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  int _pageIndex = 0;
  bool end = false;

  @override
  void initState() {
    super.initState();

    Timer.periodic(
      const Duration(seconds: 2),
      (Timer timer) {
        if (_pageIndex == 1) {
          end = true;
        } else if (_pageIndex == 0) {
          end = false;
        }

        if (end == false) {
          _pageIndex++;
        } else {
          _pageIndex--;
        }

        if (_pageController.hasClients) {
          _pageController.animateToPage(
            _pageIndex,
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
          );
        }
      },
    );

    checkOnboardingStasus();
  }

  void checkOnboardingStasus() async {
    SharedService.setOnBoardingPageShown(true);
    var onboardingStatus = await SharedService.checkOnBoarding();
    print("Status view OnBoarding : $onboardingStatus");
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              onBoardContent(),
              lineIndicator(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.055,
              ),
              daftarDanMasuk(),
            ],
          ),
        ),
      ),
    );
  }

  Widget lineIndicator() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 10,
          width: 60,
          decoration: BoxDecoration(
              color: greyThinColor, borderRadius: BorderRadius.circular(5)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              onBoardData.length,
              (index) => LineIndicator(
                isActive: index == _pageIndex,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget onBoardContent() {
    return Expanded(
      child: PageView.builder(
        itemCount: onBoardData.length,
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        controller: _pageController,
        itemBuilder: (context, index) => OnboardingContent(
          image: onBoardData[index].image,
          title: onBoardData[index].title,
          description: onBoardData[index].description,
        ),
      ),
    );
  }

  Widget daftarDanMasuk() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 50),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: pomegranate,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
              child: Text(
                "Daftar",
                style: whiteTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: whiteColor,
                  side: const BorderSide(color: pomegranate)),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: Text(
                "Masuk",
                style: pomegranateTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<Onboard> onBoardData = [
  Onboard(
      image: "images/illustrations1.png",
      title: "SurveyAsia platform survey terpercaya",
      description:
          "Bagikan pendapat Anda dengan mengisi survey di SurveyAsia."),
  Onboard(
      image: "images/illustrations2.png",
      title: "Isi survey dan dapatkan hadiahnya",
      description:
          "Kumpulkan poin dengan cara gabung ke aplikasi dan mengisi survey sesuai minat Anda."),
];

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.3,
        ),
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: greyTextStyle.copyWith(
              fontWeight: regular,
              fontSize: 14,
            ),
          ),
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
