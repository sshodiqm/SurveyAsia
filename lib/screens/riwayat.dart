import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survei_asia/res/theme.dart';
import 'package:survei_asia/screens/add_ewallet.dart';
import 'package:survei_asia/screens/tukar_poin_nominal.dart';
import 'package:survei_asia/widgets/survey_history_card.dart';

// Untuk testing
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(home: Riwayat2()));
}

class Riwayat2 extends StatefulWidget {
  // const Riwayat2({Key? key}) : super(key: key);

  @override
  _Riwayat2State createState() => _Riwayat2State();
// State<StatefulWidget> createState() => _Riwayat2State();
}

class _Riwayat2State extends State<Riwayat2> {
  List<Tab> myTab = [
    Tab(
      text: "Survey & Penukaran",
    ),
    Tab(
      text: "E-Wallet",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Perolehan Poin",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(child: Container(
        child: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 120,
                color: Colors.orangeAccent,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 1 / 2,
                      height: 75,
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Poin Surveyasia",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "0",
                            style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 1 / 2,
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            alignment: Alignment.center,
                            // padding: EdgeInsets.only(right: 18, left: 18, top: 6, bottom: 6),
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: pomegranate

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,

                              children: [

                              SizedBox(width: 5),
                              Text(
                              'Tarik poin',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 12)),
                              SizedBox(width: 5),
                            ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            alignment: Alignment.center,
                            // padding: EdgeInsets.only(right: 18, left: 18, top: 6, bottom: 6),
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.deepOrange,
                                  width: 2
                                ),
                                color: Colors.white
                                // color: pomegranate
                            ),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children : [
                                Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                      backgroundColor: pomegranate,
                                      minimumSize:  const Size.fromHeight(30),
                                      //shape: RoundedRectangleBorder(
                                     // borderRadius: BorderRadius.circular(6),
                                     // ),
                                       ),

                                      child : const Text(
                                        'E-Wallet',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white),
                                      ),

                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return const AddEWallet(); //-> tambah E-Wallet
                                            },
                                          ),
                                          //mainAxisAlignment: MainAxisAlignment.start,
                                          //mainAxisSize: MainAxisSize.min,


                                            //SvgPicture.asset('assets/svg/icontambah.svg',),
                                            //SizedBox(width: 4),

                                        );
                                      },
                                      )
                              )
                              ],
                          )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              DefaultTabController(
                  length: myTab.length, // length of tabs
                  initialIndex: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: TabBar(
                              labelColor: Colors.deepOrange,
                              unselectedLabelColor: Colors.grey,
                              indicatorColor: Colors.deepOrange,
                              tabs: myTab),
                        ),
                        Container(
                            height: 390, //height of TabBarView
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: TabBarView(children: <Widget>[
                              ListView(
                                children: [
                                  SurveyHistoryCard(title: 'Survey Pengguna Mobil Listrik Tesla', date: '30-09-2022', points: 1000, isDrawn: false),
                                  SurveyHistoryCard(title: 'Survey Pengguna Mobil Listrik Tesla', date: '30-09-2022', points: 1000, isDrawn: false),
                                  SurveyHistoryCard(title: 'Survey Pengguna Mobil Listrik Tesla', date: '30-09-2022', points: 15000, isDrawn: true)

                                  // Gunakan blok ini untuk survey yang belum diisi
                                  /*
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 100, bottom: 25),
                                    child: Center(
                                        child: SvgPicture.asset(
                                            'assets/svg/animasi_riwayat.svg')
                                        ),
                                  ),
                                  Center(
                                    child: Text(
                                        'Anda belum melakukan pengisian survey',
                                        style: TextStyle(fontSize: 14)),
                                  )

                                   */
                                ],
                              ),

                              Container(
                                child: Center(
                                  child: Text('Display Tab 2',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ]))
                      ])),
            ]),
      )),
    );
  }
}
