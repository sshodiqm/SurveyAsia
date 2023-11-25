import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survei_asia/res/theme.dart';
import 'package:survei_asia/screens/login.dart';
import 'package:survei_asia/screens/main_screens.dart';

class PasswordChanged extends StatefulWidget {
  const PasswordChanged({Key? key}) : super(key: key);

  @override
  _PasswordChanged createState() => _PasswordChanged();
}

class _PasswordChanged extends State<PasswordChanged> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(padding: const EdgeInsets.only(top: 120), children: [
        SvgPicture.asset(
          "assets/svg/illustrations10.svg",
          width: 220,
          height: 262,
        ),
        Container(
          margin: const EdgeInsets.only(top: 32.0),
          child: const Text(
            'Berhasil diubah!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16.0),
          child: const Text(
            'Perubahan kata sandi berhasil diubah',
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 16.0),
          width: double.infinity,
          height: 48,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }));
              },
              style: ElevatedButton.styleFrom(
                primary: pomegranate,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text(
                "Masuk",
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
