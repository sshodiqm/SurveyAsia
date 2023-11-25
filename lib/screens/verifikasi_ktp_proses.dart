import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../res/theme.dart';

class VerifikasiKtpProses extends StatelessWidget {
  const VerifikasiKtpProses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: 117),
          Container(
              width: 255,
              height: 194,
              child: SvgPicture.asset('assets/svg/illustrations13.svg')),
          SizedBox(
            height: 40,
          ),
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 1 / 18),
              child: Column(children: [
                Text(
                  'Menunggu verifikasi',
                  style: blackTextStyle.copyWith(
                      fontSize: 20, fontWeight: semiBold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  'Akun Anda sedang diverifikasi oleh tim kami hingga 1x24 jam',
                  style: secondBlackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: regular,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 105),
              ])),
          Row(children: [
            SizedBox(width: MediaQuery.of(context).size.width * 1 / 18),
            ElevatedButton(
                onPressed: () {
                  /*
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const VerifikasiKtpProses()));

                   */
                },
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll<Color>(pomegranate),
                    shape: MaterialStatePropertyAll<OutlinedBorder>(
                        RoundedRectangleBorder(
                            side: const BorderSide(color: pomegranate),
                            borderRadius: BorderRadius.circular(6))),
                    fixedSize: MaterialStatePropertyAll<Size>(
                        Size(MediaQuery.of(context).size.width * 8 / 9, 48))),
                child: Text('Oke',
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w600))),
            SizedBox(width: MediaQuery.of(context).size.width * 1 / 18),
          ]),
          const SizedBox(height: 112)
        ],
      ),
    ));
  }
}
