import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survei_asia/screens/pengisian_survey.dart';
import 'package:survei_asia/screens/survey_content.dart';

import '../models/response_survey.dart';
import '../res/theme.dart';
import 'login.dart';

class SurveyDetail extends StatelessWidget {
  final SurveyContent? content;
  final DataSurvey? dataSurvey;

  const SurveyDetail({
    Key? key,
    this.dataSurvey,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
        elevation: 0,
      ),
      // backgroundColor: lightGrey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.asset(
                    "images/content_image.png",
                    width: MediaQuery.of(context).size.width,
                    height: 188,
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 10, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          padding:
                              EdgeInsets.only(left: 0, top: 16, bottom: 16),
                          iconSize: 20,
                          alignment: Alignment.centerLeft,
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          dataSurvey!.namaSurvey,
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              "${dataSurvey!.tanggalMulai} - ${dataSurvey!.tanggalSelesai}",
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Image.asset('images/foto_profil.png'),
                            SizedBox(width: 4),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dataSurvey!.author,
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: whiteColor,
                                  ),
                                ),
                                const Text(
                                  "Author",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: regular,
                                    color: whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
                color: whiteColor,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Row(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width * 15 / 36,
                        height: 60,
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Estimasi Pengerjaan",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time,
                                  color: pomegranate,
                                ),
                                Text(
                                  " ${dataSurvey!.waktuPengerjaan} Menit",
                                  textAlign: TextAlign.start,
                                  style: pomegrateTextStyle.copyWith(
                                      fontWeight: medium),
                                ),
                              ],
                            ),
                          ],
                        )),
                    SizedBox(width: MediaQuery.of(context).size.width * 2 / 36),
                    Container(
                        width: MediaQuery.of(context).size.width * 15 / 36,
                        height: 60,
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Jumlah Pertanyaan",
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 12),
                            ),
                            // const Icon(Icons.access_time),
                            const SizedBox(height: 8.0),
                            Text(
                              "${dataSurvey!.jumlahPertanyaan} Pertanyaan",
                              textAlign: TextAlign.start,
                              style: pomegrateTextStyle.copyWith(
                                fontWeight: medium,
                              ),
                            ),
                          ],
                        )),
                  ],
                )),
            Container(
              color: whiteColor,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width * 15 / 36,
                      height: 60,
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Status",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 12),
                          ),
                          // const Icon(Icons.access_time),
                          const SizedBox(height: 8.0),
                          Text(
                            "Aktif",
                            textAlign: TextAlign.start,
                            style:
                                pomegrateTextStyle.copyWith(fontWeight: medium),
                          ),
                        ],
                      )),
                  SizedBox(width: MediaQuery.of(context).size.width * 2 / 36),
                  Container(
                      width: MediaQuery.of(context).size.width * 15 / 36,
                      height: 60,
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Jumlah Hadiah",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          // const Icon(Icons.access_time),
                          const SizedBox(height: 8.0),
                          Text(
                            "${dataSurvey!.poin} Poin",
                            textAlign: TextAlign.start,
                            style:
                                pomegrateTextStyle.copyWith(fontWeight: medium),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              // width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(right: 16, left: 16),
              decoration: const BoxDecoration(
                  color: lightGrey,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                "Deskripsi",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),
            Container(
              // width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(right: 16, left: 16),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              padding: const EdgeInsets.all(16.0),
              child: Text(
                dataSurvey!.deskripsi,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
                // width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(right: 16, left: 16),
                decoration: const BoxDecoration(
                    color: beige,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                padding: const EdgeInsets.all(16),
                /*
              child:  const Text("*Jawab studi dengan jujur dan konsisten, agar kami dapat memberikan survey yang sesuai dengan kamu kedepannya.",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
    
              */
                child: RichText(
                    text: TextSpan(
                        style: blackTextStyle.copyWith(fontSize: 10),
                        children: <TextSpan>[
                      TextSpan(
                          text: '*Jawab studi dengan jujur dan konsisten, ',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      TextSpan(
                          text:
                              'agar kami dapat memberikan survey yang sesuai dengan kamu kedepannya.',
                          style: TextStyle(fontWeight: regular))
                    ]))),
            const SizedBox(height: 16)
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: pomegranate,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return PengisianSurvey();
                    }));
                  },
                  child: const Text(
                    'Mulai',
                    style: TextStyle(fontSize: 16),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
