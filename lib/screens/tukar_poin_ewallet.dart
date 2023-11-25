import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survei_asia/res/theme.dart';
import 'package:survei_asia/screens/beranda.dart';

class TukarPoinEwallet extends StatefulWidget {
  const TukarPoinEwallet({Key? key}) : super(key: key);

  @override
  _TukarPoinEwallet createState() => _TukarPoinEwallet();
}

class _TukarPoinEwallet extends State<TukarPoinEwallet> {
  @override
  void initState() {
    super.initState();
  }

  Object? _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Tukar Poin",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          leading: const BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: SafeArea(
          child: ListView(children: [
            Container(
              margin: const EdgeInsets.only(left: 20.0, top: 21, bottom: 21),
              child: const Text(
                'Metode Penukaran',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),

            RadioListTile(
              groupValue: _value,
              value: 1,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
              toggleable: true,
              title: Text('Gopay'),
              tileColor: Colors.white,
              activeColor: Colors.orange,
              secondary: Image.asset(
                "images/gopaylogo.png",
                height: 30,
                width: 30,
              ),
              controlAffinity: ListTileControlAffinity.trailing,
            ),

            const SizedBox(height: 5.0),

            RadioListTile(
              groupValue: _value,
              value: 2,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
              toggleable: true,
              title: Text('Dana'),
              tileColor: Colors.white,
              activeColor: Colors.orange,
              secondary: Image.asset(
                "images/dana.png",
                height: 30,
                width: 30,
              ),
              controlAffinity: ListTileControlAffinity.trailing,
            ),

            Container(
              margin: const EdgeInsets.only(top: 21),
              child: const Text(
                'Aktifkan E-Wallet lainnya \n pada menu Tambah E-Wallet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 400),
              width: double.infinity,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const BerandaScreen(); //->tarik poin berhasil
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: pomegranate,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    "Tukarkan Poin",
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
