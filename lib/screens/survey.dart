import 'package:flutter/material.dart';
import 'package:survei_asia/screens/survey_detail.dart';
import 'package:survei_asia/screens/survey_public_member.dart';
import '../models/response_survey.dart';
import '../res/theme.dart';
import '../services/api_service.dart';
import '../widgets/loading_page.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({Key? key}) : super(key: key);

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  List<DataSurvey> listSurvey = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getSurveyData();
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
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Survey",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
      ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16,15,16,0),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Search Survey",
                  prefixIcon: Icon(Icons.search, color: pomegranate,),
                  prefixIconColor: pomegranate,
                ),
              ),
            ),
            Expanded(
              child: (loading) ? const LoadingPage() : SurveyList(dataSurvey: listSurvey),
            )
          ],
        ),
      );
  }
}

class SurveyList extends StatelessWidget {
  final List<DataSurvey>? dataSurvey;
  const SurveyList({Key? key, required this.dataSurvey}) : super(key: key);

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
