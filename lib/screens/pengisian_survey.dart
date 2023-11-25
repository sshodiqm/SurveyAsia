import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survei_asia/screens/pengisian_survey_selesai.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../res/theme.dart';

class PengisianSurvey extends StatefulWidget {
  const PengisianSurvey({Key? key}) : super(key: key);

  @override
  State<PengisianSurvey> createState() => _PengisianSurveyState();
}

class _PengisianSurveyState extends State<PengisianSurvey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Survey',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: pomegranate,
        elevation: 1,
      ),
      body: const WebView(
        initialUrl:
            'https://surveyjs.io/published?id=74f9051f-d788-4498-8b0c-b6f507e0bc58',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}


// class PengisianSurvey extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//         appBar: AppBar(
//         centerTitle: true,
//         title: const Text(
//           "Survey",
//           style: TextStyle(
//               color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
//         ),
//         leading: const BackButton(
//           color: Colors.white,
//         ),
//         backgroundColor: pomegranate,
//         elevation: 1,
//       ),
//
//       body: const WebView(
//         initialUrl: 'https://flutter.dev',
//       )

      // SafeArea(
      //   child : ListView(
      //     padding: EdgeInsets.all(20),
      //     children: <Widget>[
      //       Image.asset(
      //           "images/image1.png",
      //           height: 100,
      //           width: 250,
      //       ),
      //       Container(
      //       margin: const EdgeInsets.only(left: 50,right: 50,top: 50),
      //         child: Text(
      //           "Jejak Pendapat Pemilu",
      //           textAlign: TextAlign.center,
      //           style: blackTextStyle.copyWith(
      //             fontWeight: bold,
      //             fontSize: 30,
      //           ),
      //         ),
      //       ),
      //       Container(
      //       margin: const EdgeInsets.only(left: 50,right: 50),
      //       alignment: Alignment.topCenter,
      //         child: Text(
      //           "15/08/2022",
      //           textAlign: TextAlign.center,
      //           style: blackTextStyle.copyWith(
      //             fontSize: 15,
      //           ),
      //         ),
      //       ),
      //       Container(
      //         alignment: Alignment.center,
      //         height: 300,
      //         child: Text("Ini Web View",style: TextStyle(fontWeight: FontWeight.bold,)),
      //       ),
      //       Container(
      //         height: MediaQuery.of(context).size.height * 0.065,
      //         // alignment: Alignment.bottomRight,
      //         padding: EdgeInsets.only(left: 230, right: 10),
      //         child: ElevatedButton(
      //             style: ElevatedButton.styleFrom(
      //               primary: Colors.green,
      //                 shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(6))),
      //                   onPressed: () {
      //                 Navigator.push(context, MaterialPageRoute(builder: (context) {
      //                   return PengisianSurveySelesai();
      //                 }));
      //               },
      //             child: const Text(
      //               'Kirim',
      //               style: TextStyle(fontSize: 16),
      //             )),
      //       )
      //     ],
      //   ),
      // )
      
//     );
//   }
// }
