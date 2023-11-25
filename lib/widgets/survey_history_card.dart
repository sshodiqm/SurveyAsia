import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:survei_asia/res/theme.dart';
import 'package:survei_asia/widgets/custom_popup_button.dart';

/// Tampilan item untuk riwayat survey.
class SurveyHistoryCard extends StatelessWidget {
  final String title;
  final String date;
  final int points;
  final bool isDrawn;

  SurveyHistoryCard(
      {required this.title,
      required this.date,
      required this.points,
      required this.isDrawn});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (isDrawn) {
            CustomPopup(
              img: '',
              imgWidth: 0,
              imgHeight: 0,
              title: 'Detail Riwayat',
              buttonText1: 'Tutup',
              buttonFunction1: () {
                Navigator.of(context, rootNavigator: true).pop();
              },
            ).showWithdrawnPoints(context, points);
          } else {
            CustomPopup(
                img: '',
                imgWidth: 0,
                imgHeight: 0,
                title: 'Detail Riwayat',
                buttonText1: 'Tutup',
                buttonFunction1: () {
                  Navigator.of(context, rootNavigator: true).pop();
                }). showFinishedSurvey(context);
          }
        },
        child: Container(
          color: diamondOrange.withOpacity(0.15),
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 5 / 36,
                height: 60,
                padding:
                    EdgeInsets.only(left: 23, top: 20, bottom: 20, right: 10),
                child: SvgPicture.asset(
                  (isDrawn)
                      ? 'assets/svg/download.svg'
                      : 'assets/svg/paper.svg',
                  width: 17,
                  height: 19,
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.topCenter,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 21 / 36,
                height: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (isDrawn)
                          ? 'Anda telah menukarkan poin dengan GO-PAY'
                          : 'Anda telah menyelesaikan $title',
                      style: blackTextStyle.copyWith(
                          fontSize: 10, fontWeight: regular),
                    ),
                    Text(
                      date,
                      style: greyTextStyle.copyWith(
                          fontSize: 10, fontWeight: regular),
                    )
                  ],
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 10 / 36,
                  height: 60,
                  padding: EdgeInsets.only(right: 20),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text('${(isDrawn) ? '-' : ''}$points poin',
                          style: GoogleFonts.poppins(
                            color: diamondOrange,
                              fontSize: 12, fontWeight: FontWeight.w600)))

                  ),
            ],
          ),
        ));
  }
}
