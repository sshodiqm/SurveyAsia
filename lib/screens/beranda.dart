import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';
import 'package:survei_asia/models/response_news.dart';
import 'package:survei_asia/screens/rekomendasi_survey.dart';
import 'package:flutter_svg/svg.dart';
import 'package:survei_asia/screens/riwayat.dart';
import 'package:survei_asia/screens/survey_public_member.dart';
import 'package:survei_asia/services/api_service.dart';
import 'package:survei_asia/widgets/loading_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../models/response_model.dart';
import '../models/response_survey.dart';
import '../res/theme.dart';
import '../services/shared_service.dart';
import '../widgets/question_list.dart';
import 'login.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  Data? loginResponse;
  int _current = 1;
  List<DataSurvey> listSurvey = [];
  bool isLoadingSurvey = true;
  bool isLoadingNews = true;
  List<DataNews> listNews = [];
  List<Widget> carouselContent = [];
  bool isLoggedIn = false;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
    checkLogin();
    getNewsFeeds();
    getSurveyData();
  }

  void checkLogin() async {
    var loginData = await SharedService.loginDetails();
    setState(() {
      if (loginData != null) {
        loginResponse = loginData.data[0];
        isLoggedIn = true;
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
  }

  void getSurveyData() async {
    var data = await APIService.getAllSurvey();

    if (mounted) {
      setState(() {
        if (data != null) {
          listSurvey = data;
          isLoadingSurvey = false;
        }
      });
    }
  }

  void getNewsFeeds() async {
    var news = await APIService.getAllNews();
    if (news != null) {
      if (mounted) {
        setState(
          () {
            isLoadingNews = false;
            listNews = news;
            carouselContent = listNews
                .map(
                  (items) => GestureDetector(
                    onTap: () async => await launchUrlString(
                      items.link,
                      mode: LaunchMode.externalApplication,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "images/${items.header}",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                )
                .toList();
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: pomegranate,
          toolbarHeight: 0,
          elevation: 0,
        ),
        backgroundColor: secondWhite,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Header Container
                Container(
                  height: 365,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [signalOrange, pomegranate],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Background Image
                      const Positioned(
                        right: -85,
                        child: ClipRect(
                          child: Image(
                            height: 180,
                            fit: BoxFit.fitHeight,
                            image: AssetImage("images/gradient_icon.png"),
                          ),
                        ),
                      ),

                      // Header (account, title, poin)
                      Container(
                        margin:
                            const EdgeInsets.only(top: 10, right: 20, left: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                (isLoggedIn)
                                    ? sudahLogin(context)
                                    : belumLogin(context),
                                IconButton(
                                    iconSize: 30,
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.all(0),
                                    onPressed: () {
                                      (isLoggedIn)
                                          ? null // -> isi ke halaman notifikasi
                                          : Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return const LoginScreen(); //-> ke halaman login
                                                },
                                              ),
                                            );
                                    },
                                    icon: const Icon(
                                      Icons.notifications_outlined,
                                      color: Colors.white,
                                    )),
                              ],
                            ),

                            // Header Title
                            Container(
                              alignment: Alignment.centerLeft,
                              margin:
                                  const EdgeInsets.only(bottom: 12.0, top: 8.0),
                              child: const Text(
                                'Selamat datang di SurveyAsia!',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),

                            // Total Poin & Lihat Detail
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      contentPadding: const EdgeInsets.only(
                                        left: 20,
                                        right: 5,
                                      ),
                                      dense: true,
                                      visualDensity:
                                          const VisualDensity(vertical: -1),
                                      leading: SvgPicture.asset(
                                          "assets/svg/poin_icon.svg",
                                          height: 40),
                                      title: const Text(
                                        "Total Poin",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      subtitle: const Text(
                                        "0",
                                        style: TextStyle(
                                          color: pomegranate,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return Riwayat2(); //-> simpan password baru
                                              },
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: pomegranate,
                                          minimumSize:
                                              const Size.fromHeight(30),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                        child: const Text("Lihat Detail"),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                      // Carousel
                      Positioned(
                        bottom: 0,
                        child: Column(
                          children: [
                            // Carousel Content
                            Container(
                              height: 189,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                  color: secondWhite,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: (isLoadingNews)
                                  ? // Shimmer Loading
                                  Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          // Carousel Content Loading
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topRight:
                                                          Radius.circular(10),
                                                      bottomRight:
                                                          Radius.circular(10),
                                                    ),
                                                    color: Colors.white),
                                                height: 150,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white),
                                                height: 150,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.84,
                                              ),
                                              Container(
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                    ),
                                                    color: Colors.white),
                                                height: 150,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.04,
                                              ),
                                            ],
                                          ),

                                          // Distance between Carousel Content Loading & Indicator Loading
                                          const SizedBox(
                                            height: 8,
                                          ),

                                          // Carousel Indicator Loading
                                          Container(
                                            height: 10,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    )
                                  : // Carousel Content(2)
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // Carousel Content
                                        CarouselSlider(
                                          items: carouselContent,
                                          carouselController: _controller,
                                          options: CarouselOptions(
                                            initialPage: _current,
                                            viewportFraction: 0.88,
                                            height: 145,
                                            autoPlay: true,
                                            onPageChanged: (index, reason) {
                                              setState(
                                                () {
                                                  _current = index;
                                                },
                                              );
                                            },
                                          ),
                                        ),

                                        // Indicator
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: carouselContent
                                              .asMap()
                                              .entries
                                              .map(
                                            (entry) {
                                              return GestureDetector(
                                                onTap: () => _controller
                                                    .animateToPage(entry.key),
                                                child: AnimatedContainer(
                                                  duration: const Duration(
                                                      milliseconds: 300),
                                                  width: (_current == entry.key)
                                                      ? 35.0
                                                      : 9.0,
                                                  height: 9.0,
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          5, 12, 5, 0),
                                                  decoration: BoxDecoration(
                                                      // shape: BoxShape.circle,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9),
                                                      color: (_current ==
                                                              entry.key)
                                                          ? pomegranate
                                                          : grey),
                                                ),
                                              );
                                            },
                                          ).toList(),
                                        ),
                                      ],
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //QuickPolling

                Container(
                  width: 800,
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'QOTD',
                        style: TextStyle(fontSize: 14, fontWeight: bold),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        'Ayo isi Question Of The Day (QOTD) setiap hari!',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     const Text(
                  //       'QOTD',
                  //       textAlign: TextAlign.left,
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.w600, fontSize: 14),
                  //     ),
                  //     const Text(
                  //       'Pertanyaan 0/6',
                  //       textAlign: TextAlign.right,
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.w600, fontSize: 14),
                  //     )
                  //   ]
                  // ),
                ),
                // Expanded(
                //   child: ListView.separated(
                //     itemBuilder: (context, index) => Container(
                //       height: 100,
                //       color: blackColor,
                //     ),
                //     separatorBuilder: (context, index) => const SizedBox(height: 8,),
                //     itemCount: 5
                //   ),
                // ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: diamondOrange,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5)
                          )
                        ),
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 3,),
                            SvgPicture.asset('assets/svg/maskot.svg'),
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'QOTD',
                                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: bold),
                                  ),
                                  Text(
                                    'Question Of The Day',
                                    style: TextStyle(color: Colors.white, fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 40,),
                            SvgPicture.asset('assets/svg/ttanya.svg'),
                            SizedBox(width: 0.1,),
                          ],
                        ),
                      ),
                      Container(
                        color: whiteColor,
                        child: Container(
                          margin: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              QuestionList(),
                              SizedBox(height: 8,),
                              QuestionList(),
                              SizedBox(height: 8,),
                              QuestionList(),
                              SizedBox(height: 8,),
                              QuestionList(),
                              SizedBox(height: 8,),
                              QuestionList(),
                            ],
                          ),
                        ),
                      ),
                    ]
                  ),
                ),


                // ListTile(
                //   contentPadding:
                //       const EdgeInsets.only(left: 20.0, right: 20.0),
                //   minLeadingWidth: 10,
                //   title: const Text('Apakah Anda suka minum teh di pagi hari',
                //       style:
                //           TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
                //   trailing: const Icon(Icons.keyboard_arrow_right_rounded,
                //       color: blackColor),
                //   onTap calls When ListTile Taps
                //   onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => RewardScreen(),
                //   ),
                // );
                //   },
                // ),

                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Rekomendasi Untukmu',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RekomendasiSurveyScreen()));
                        },
                        child: const Text(
                          "Lihat Semua",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                isLoadingSurvey
                    ? Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08,
                          ),
                          const LoadingPage(),
                        ],
                      )
                    : Card(
                        color: secondWhite,
                        elevation: 0,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        // height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: [
                            ListSurvey(
                              dataSurvey: listSurvey[0],
                            ),
                            ListSurvey(
                              dataSurvey: listSurvey[1],
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Stack sudahLogin(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 0),
            child: Row(children: [
              const Image(
                fit: BoxFit.contain,
                image: AssetImage("images/foto_null.png"),
                width: 40,
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("${loginResponse?.username}",
                    style: const TextStyle(color: Colors.white, fontSize: 14)),
              )
            ])),
      ],
    );
  }

  Stack belumLogin(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.white),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }));
              },
              child: const Text(
                "Daftar/Masuk",
                style: TextStyle(
                    fontSize: 16,
                    color: pomegranate,
                    fontWeight: FontWeight.bold),
              )),
        ),
      ],
    );
  }
}


