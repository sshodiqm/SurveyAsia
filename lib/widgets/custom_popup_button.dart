import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:survei_asia/res/theme.dart';

class CustomPopup extends StatelessWidget {
  final String img;
  final String title;
  final String? description;
  final String buttonText1;
  final String? buttonText2;
  final Color? textTitleColor;
  final Color? textDescColor;
  final double? imgWidth;
  final double? imgHeight;
  final double? distanceFromButton;
  final Null Function() buttonFunction1;
  final Null Function()? buttonFunction2;

  const CustomPopup(
      {Key? key,
      required this.img,
      required this.title,
      this.description,
      required this.buttonText1,
      this.buttonText2,
      required this.buttonFunction1,
      this.buttonFunction2,
      this.imgWidth = 150,
      this.imgHeight = 150,
      this.textTitleColor = blackColor,
      this.textDescColor = blackColor,
      this.distanceFromButton = 0})
      : super(key: key);

  Future<void> show(BuildContext context) {
    return Alert(
      context: context,
      style: AlertStyle(
        alertAlignment: Alignment.center,
        alertPadding: EdgeInsets.all(20),
        buttonAreaPadding: EdgeInsets.only(
            bottom: 30, top: distanceFromButton!, left: 12, right: 12),
        backgroundColor: whiteColor,
        overlayColor: Colors.black.withOpacity(0.25),
        isCloseButton: false,
        animationType: AnimationType.grow,
        animationDuration: const Duration(milliseconds: 400),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colors.grey,
          ),
        ),
        buttonsDirection: ButtonsDirection.column,
      ),
      buttons: [
        DialogButton(
          onPressed: buttonFunction1,
          height: 50,
          color: pomegranate,
          child: Text(
            buttonText1,
            style: blackTextStyle.copyWith(
                color: whiteColor, fontSize: 16, fontWeight: semiBold),
          ),
        ),
        if (buttonText2 != null)
          DialogButton(
            onPressed: buttonFunction2,
            height: 50,
            color: whiteColor,
            border: Border.all(color: pomegranate),
            child: Text(
              buttonText2!,
              style: blackTextStyle.copyWith(
                  color: pomegranate, fontSize: 16, fontWeight: semiBold),
            ),
          ),
      ],
      content: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 15),
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              img,
              width: imgWidth!,
              height: imgHeight!,
            ),
            /* Khusus untuk yang access denied ga bisa pake svg
              Image.asset(
                img,
                width: 150,
                height: 150,
              ),*/
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: blackTextStyle.copyWith(
                  color: textTitleColor, fontSize: 20, fontWeight: bold),
            ),
            const SizedBox(
              height: 6,
            ),
            if (description != null)
              Text(
                description!,
                textAlign: TextAlign.center,
                style: blackTextStyle.copyWith(
                    color: textDescColor, fontSize: 14, fontWeight: regular),
              ),
            // SizedBox(
            //   height: distanceFromButton,
            // ),
          ],
        ),
      ),
    ).show();
  }

  // Untuk riwayat survey
  Future<void> showFinishedSurvey(BuildContext context) {
    return Alert(
      context: context,
      style: AlertStyle(
        alertAlignment: Alignment.center,
        alertPadding: EdgeInsets.all(20),
        buttonAreaPadding: EdgeInsets.only(
            bottom: 30, top: distanceFromButton!, left: 12, right: 12),
        backgroundColor: whiteColor,
        overlayColor: Colors.black.withOpacity(0.25),
        isCloseButton: false,
        animationType: AnimationType.grow,
        animationDuration: const Duration(milliseconds: 400),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colors.grey,
          ),
        ),
        buttonsDirection: ButtonsDirection.column,
      ),
      buttons: [
        DialogButton(
          onPressed: buttonFunction1,
          height: 50,
          color: pomegranate,
          child: Text(
            buttonText1,
            style: blackTextStyle.copyWith(
                color: whiteColor, fontSize: 16, fontWeight: semiBold),
          ),
        ),
        if (buttonText2 != null)
          DialogButton(
            onPressed: buttonFunction2,
            height: 50,
            color: whiteColor,
            border: Border.all(color: pomegranate),
            child: Text(
              buttonText2!,
              style: blackTextStyle.copyWith(
                  color: pomegranate, fontSize: 16, fontWeight: semiBold),
            ),
          ),
      ],
      content: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 15),
        child: Column(
          children: <Widget>[

            Text(
              title,
              style: blackTextStyle.copyWith(
                  color: textTitleColor, fontSize: 20, fontWeight: bold),
            ),
            SizedBox(height: 25),
            Container(
              width: 280,
              height: 48,
              padding: EdgeInsets.only(left: 12, top: 15, bottom: 15),
              child: Text(
                'Survey Kepuasan Pengguna',
                style: blackTextStyle.copyWith(
                    fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Reward',
                            style: greyTextStyle.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w600)),
                        SizedBox(height: 6),
                        Text(
                          '1000 poin',
                          style: GoogleFonts.poppins(
                            color: diamondOrange,
                              fontSize: 12, fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    )),
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tanggal',
                            style: greyTextStyle.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w600)),
                        SizedBox(height: 6),
                        Text(
                          '30-09-2022',
                          style: blackTextStyle.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        )
                      ],
                    ))
              ],
            ),
            SizedBox(height: 31),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Kriteria Penilaian',
                    style: greyTextStyle.copyWith(
                        fontSize: 12, fontWeight: FontWeight.w600))),
            SizedBox(height: 5),
            Row(
              children: [
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: SvgPicture.asset('assets/svg/shield_done.svg'))),
                Flexible(
                    flex: 9,
                    fit: FlexFit.tight,
                    child: Text(
                        'Survey selesai dan disetujui oleh tim riset SurveyAsia',
                        style: blackTextStyle.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w600))),
              ],
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    ).show();
  }

  // Untuk riwayat penarikan
  Future<void> showWithdrawnPoints(BuildContext context, int points) {
    return Alert(
      context: context,
      style: AlertStyle(
        alertAlignment: Alignment.center,
        alertPadding: EdgeInsets.all(20),
        buttonAreaPadding: EdgeInsets.only(
            bottom: 30, top: distanceFromButton!, left: 12, right: 12),
        backgroundColor: whiteColor,
        overlayColor: Colors.black.withOpacity(0.25),
        isCloseButton: false,
        animationType: AnimationType.grow,
        animationDuration: const Duration(milliseconds: 400),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colors.grey,
          ),
        ),
        buttonsDirection: ButtonsDirection.column,
      ),
      buttons: [
        DialogButton(
          onPressed: buttonFunction1,
          height: 50,
          color: pomegranate,
          child: Text(
            buttonText1,
            style: blackTextStyle.copyWith(
                color: whiteColor, fontSize: 16, fontWeight: semiBold),
          ),
        ),
        if (buttonText2 != null)
          DialogButton(
            onPressed: buttonFunction2,
            height: 50,
            color: whiteColor,
            border: Border.all(color: pomegranate),
            child: Text(
              buttonText2!,
              style: blackTextStyle.copyWith(
                  color: pomegranate, fontSize: 16, fontWeight: semiBold),
            ),
          ),
      ],
      content: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 15),
        child: Column(
          children: <Widget>[
            Text(
              title,
              style: blackTextStyle.copyWith(
                  color: textTitleColor, fontSize: 20, fontWeight: bold),
            ),
            SizedBox(height: 25),
            Container(
              width: 280,
              height: 48,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                    Text('Tarik poin menggunakan e-wallet :',
                        style: greyTextStyle.copyWith(
                            fontSize: 12, fontWeight: FontWeight.w600)),

                    Image.asset('images/gopay.png', width: 74, height: 28,),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Jumlah Saldo',
                            style: greyTextStyle.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w600)),
                        SizedBox(height: 6),
                        Text(
                          'Rp. 15.000',
                          style: GoogleFonts.poppins(
                            color: diamondOrange,
                              fontSize: 12, fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tanggal',
                            style: greyTextStyle.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w600)),
                        SizedBox(height: 6),
                        Text(
                          '30-09-2022',
                          style: blackTextStyle.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        )
                      ],
                    ))
              ],
            ),
            SizedBox(height: 31),
            Align(
                alignment: Alignment.centerLeft,
                child: Text('Status',
                    style: greyTextStyle.copyWith(
                        fontSize: 12, fontWeight: FontWeight.w600))),
            SizedBox(height: 5),
            Row(
              children: [
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: SvgPicture.asset('assets/svg/shield_done.svg'))),
                Flexible(
                    flex: 9,
                    fit: FlexFit.tight,
                    child: Text('Selesai',
                        style: GoogleFonts.poppins(
                            color: Color(0xff00BA88),
                            fontSize: 12,
                            fontWeight: FontWeight.w600))),
              ],
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
