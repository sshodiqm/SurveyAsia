import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survei_asia/res/theme.dart';
import 'package:survei_asia/screens/beranda.dart';

class GetReward extends StatefulWidget {
  const GetReward({Key? key}) : super(key: key);

  @override
  _GetReward createState() => _GetReward();
}

class _GetReward extends State<GetReward> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView(padding: const EdgeInsets.only(top: 188), children: [
            SvgPicture.asset(
              "assets/svg/get_reward.svg",
              width: 165,
              height: 167,
            ),
            Container(
              margin: const EdgeInsets.only(top: 32.0),
              child: const Text(
                'Terima kasih Anda telah mengisi Survey',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: const Text(
                'Reward:',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: const Text(
                '+1000 Poin',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: diamondOrange,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 64.0),
              width: double.infinity,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const BerandaScreen();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: pomegranate,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    "Kembali ke Beranda",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
