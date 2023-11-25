import 'package:flutter/material.dart';

import '../res/theme.dart';

class TukarPoin extends StatefulWidget {
  const TukarPoin({Key? key}) : super(key: key);

  @override
  State<TukarPoin> createState() => _TukarPoinState();
}

class _TukarPoinState extends State<TukarPoin> {
  List<bool> selectedButtons = List.filled(6, false);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: const Text(
          'Verifikasi KTP',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: whiteColor,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 28),
            Container(
                width: MediaQuery.of(context).size.width * 8 / 9,
                height: 72,
                child: Text(
                  'Tukar poin ke Bentuk E-Wallet',
                  style: blackTextStyle.copyWith(
                      fontSize: 24, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                )),
            SizedBox(height: 20),
            Container(
                width: MediaQuery.of(context).size.width * 8 / 9,
                height: 42,
                child: Text(
                  'Pilih nominal e-wallet yang ingin kamu tukarkan',
                  style: blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.start,
                )),
            SizedBox(height: 16),
            GridView.count(crossAxisCount: 3, children: [
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      for (int i = 0; i < 6; i++) {
                        if (selectedButtons[i] == selectedButtons[0]) {
                          selectedButtons[i] = true;
                        } else {
                          selectedButtons[i] = false;
                        }
                      }
                    });
                  },
                  style: ButtonStyle(shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
                    if (selectedButtons[0] == true) {
                      return StadiumBorder(side: BorderSide(color: ));
                    } else {
                      return StadiumBorder(side: BorderSide(color: ));
                    }
                  })),
                  child: Text('25.000',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: regular))),

            ])
          ],
        ),
      ),

       */
    );



  }
}
