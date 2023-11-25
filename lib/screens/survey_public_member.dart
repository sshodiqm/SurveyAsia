import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:survei_asia/models/response_survey.dart';
import 'package:survei_asia/screens/survey_content.dart';
import 'package:survei_asia/screens/survey_detail.dart';
import 'package:survei_asia/services/api_service.dart';
import 'package:survei_asia/widgets/loading_page.dart';
import '../models/response_model.dart';
import 'package:survei_asia/res/theme.dart';

class SurveyPublicMemberScreen extends StatefulWidget {
  const SurveyPublicMemberScreen({
    Key? key,
    this.loginResponse,
  }) : super(key: key);

  final Data? loginResponse;

  @override
  State<SurveyPublicMemberScreen> createState() =>
      _SurveyPublicMemberScreenState();
}

class _SurveyPublicMemberScreenState extends State<SurveyPublicMemberScreen> {
  Data get loginResponse => widget.loginResponse!;
  List<DataSurvey> listSurvey = [];
  bool loading = true;

  @override
  void initState() {
    getSurveyData();
    super.initState();
  }

  void getSurveyData() async {
    var data = await APIService.getAllSurvey();

    if (mounted) {
      setState(() {
        if (data != null) {
          listSurvey = data;
          loading = false;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return (loading)
                ? const LoadingPage()
                : RekomList(dataSurvey: listSurvey);
          } else if (constraints.maxWidth <= 1200) {
            return const RekomGrid(gridCount: 4);
          } else {
            return const RekomGrid(gridCount: 6);
          }
        },
      ),
    );
  }
}

class RekomGrid extends StatelessWidget {
  final int gridCount;

  const RekomGrid({
    Key? key,
    required this.gridCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: surveyContentList.map(
          (content) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SurveyDetail(content: content);
                }));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.asset(
                        content.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        content.title,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                      child: Text(
                        content.author,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class RekomList extends StatelessWidget {
  final List<DataSurvey>? dataSurvey;
  const RekomList({Key? key, required this.dataSurvey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
      child: ListView.builder(
        itemBuilder: (_, index) => ListSurvey(dataSurvey: dataSurvey![index]),
        itemCount: dataSurvey?.length,
      ),
    );
  }
}

class ListSurvey extends StatelessWidget {
  final DataSurvey dataSurvey;

  const ListSurvey({
    Key? key,
    required this.dataSurvey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
            child: Image.asset(
              "images/artikel.png",
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  dataSurvey.namaSurvey,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      "${dataSurvey.author} | ",
                      style: const TextStyle(
                        color: Color(0xFF878787),
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      dataSurvey.kategori,
                      style: const TextStyle(
                        color: pomegranate,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(right: 16),
                  visualDensity: const VisualDensity(vertical: -4.0),
                  dense: true,
                  title: Text(
                    "${dataSurvey.tanggalMulai} - ${dataSurvey.tanggalSelesai}",
                    style: const TextStyle(
                        color: Color(0xFF878787),
                        fontSize: 9,
                        fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(
                    "${dataSurvey.poin} Poin",
                    style: const TextStyle(
                        color: pomegranate,
                        fontSize: 11,
                        fontWeight: FontWeight.w600),
                  ),
                  trailing: SizedBox(
                    height: 25,
                    width: 70,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: pomegranate),
                      onPressed: (() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SurveyDetail(dataSurvey: dataSurvey),
                          ),
                        );
                      }),
                      child: const Text(
                        "Mulai",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
