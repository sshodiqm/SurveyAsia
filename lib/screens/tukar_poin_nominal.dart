import 'package:flutter/material.dart';
import 'package:survei_asia/res/theme.dart';
import 'package:radio_grouped_buttons/radio_grouped_buttons.dart';
import 'package:survei_asia/screens/tukar_poin_ewallet.dart';

class TukarPoinNominal extends StatefulWidget {
  const TukarPoinNominal({Key? key}) : super(key: key);

  @override
  State<TukarPoinNominal> createState() => _TukarPoinNominal();
}

class _TukarPoinNominal extends State<TukarPoinNominal> {

  List<String> buttonList=[
    "25.000","50.000","100.000","200.000","300.000","400.000"];

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
              margin: const EdgeInsets.only(top: 21, bottom: 21),
              child: const Text(
                'Tukar Poin \n ke Bentuk E-Wallet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0),
              child: const Text(
                'Pilih nominal e-wallet yang ingin kamu tukarkan',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),

            SizedBox(
              height: 21,
            ),

            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: CustomRadioButton(
                buttonLables: buttonList,
                buttonValues: buttonList,
                radioButtonValue: (value,index){
                  print("Button value "+value.toString());
                  print("Integer value "+index.toString());
                },
                horizontal: true,
                buttonSpace: 8,
                buttonColor: Colors.white,
                unselectedButtonBorderColor : Colors.black,
                selectedColor: Colors.orange,
                buttonWidth: 100,
                buttonHeight: 50,
                elevation: 0,
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 360),
              width: double.infinity,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return const TukarPoinEwallet();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: pomegranate,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    "Selanjutnya",
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
