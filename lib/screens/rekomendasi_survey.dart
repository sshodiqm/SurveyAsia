import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:survei_asia/screens/survey_content.dart';
import 'package:survei_asia/screens/survey_detail.dart';
import '../models/response_model.dart';
import 'package:survei_asia/res/theme.dart';

class RekomendasiSurveyScreen extends StatefulWidget {
  const RekomendasiSurveyScreen({Key? key, this.loginResponse}) : super(key: key);
  final Data? loginResponse;

  @override
  State<RekomendasiSurveyScreen> createState() => _RekomendasiSurveyScreenState();
}

class _RekomendasiSurveyScreenState extends State<RekomendasiSurveyScreen> {

  Data get loginResponse => widget.loginResponse!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Rekomendasi Survey",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      // body: ListView(
      //   children: const [
      //     SizedBox(
      //       height: 10,
      //     ),
      //   ],
      // ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return const RekomList();
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

  const RekomGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children:
          surveyContentList.map((content) {
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
  const RekomList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          final SurveyContent content = surveyContentList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SurveyDetail(content: content);
              }));
            },
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                TextField(
                  style: TextStyle(color: Colors.black26),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: "Search Survey",
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.deepOrange,
                  ),
                ),
                // Container(
                //   height: 40,
                //   // width: 320,
                //   alignment: Alignment.center,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(6),
                //     color: Colors.white
                //   ),
                //   child: Text(
                //     "Search Survey"
                //   ),
                // ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Image.asset(content.imageAsset),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                content.title,
                                style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(content.authorName,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text('  |  ',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text(content.type,
                                    style: const TextStyle(fontSize: 12, color: Colors.deepOrange),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(content.date,
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(content.totalReward,
                                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10, left: 15),
                                    padding: EdgeInsets.only(right: 20, left: 20, top: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: pomegranate
                                    ),
                                    child: Text(
                                      'Mulai',
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Image.asset(content.imageAsset),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                content.title,
                                style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(content.authorName,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text('  |  ',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text(content.type,
                                    style: const TextStyle(fontSize: 12, color: Colors.deepOrange),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(content.date,
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(content.totalReward,
                                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10, left: 15),
                                    padding: EdgeInsets.only(right: 20, left: 20, top: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: pomegranate
                                    ),
                                    child: Text(
                                      'Mulai',
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Image.asset(content.imageAsset),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                content.title,
                                style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(content.authorName,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text('  |  ',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text(content.type,
                                    style: const TextStyle(fontSize: 12, color: Colors.deepOrange),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(content.date,
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(content.totalReward,
                                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10, left: 15),
                                    padding: EdgeInsets.only(right: 20, left: 20, top: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: pomegranate
                                    ),
                                    child: Text(
                                      'Mulai',
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Image.asset(content.imageAsset),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                content.title,
                                style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(content.authorName,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text('  |  ',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text(content.type,
                                    style: const TextStyle(fontSize: 12, color: Colors.deepOrange),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(content.date,
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(content.totalReward,
                                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10, left: 15),
                                    padding: EdgeInsets.only(right: 20, left: 20, top: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: pomegranate
                                    ),
                                    child: Text(
                                      'Mulai',
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Image.asset(content.imageAsset),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                content.title,
                                style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(content.authorName,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text('  |  ',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text(content.type,
                                    style: const TextStyle(fontSize: 12, color: Colors.deepOrange),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(content.date,
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(content.totalReward,
                                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10, left: 15),
                                    padding: EdgeInsets.only(right: 20, left: 20, top: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: pomegranate
                                    ),
                                    child: Text(
                                      'Mulai',
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Image.asset(content.imageAsset),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                content.title,
                                style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(content.authorName,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text('  |  ',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  Text(content.type,
                                    style: const TextStyle(fontSize: 12, color: Colors.deepOrange),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(content.date,
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(content.totalReward,
                                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10, left: 15),
                                    padding: EdgeInsets.only(right: 20, left: 20, top: 5, bottom: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: pomegranate
                                    ),
                                    child: Text(
                                      'Mulai',
                                      style: whiteTextStyle.copyWith(
                                          fontSize: 14),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          );
        },
        itemCount: surveyContentList.length,
      ),
    );
  }
}
// class RekomendasiSurveyContent extends StatelessWidget {
//   const RekomendasiSurveyContent({
//     Key? key,
//     required this.icon,
//     required this.title,
//     required this.onTapFunction,
//   }) : super(key: key);
//
//   final IconData icon;
//   final String title;
//   final Null Function() onTapFunction;

  // @override
  // Widget build(BuildContext context) {
  //   return ListTile(
  //       visualDensity: const VisualDensity(vertical: -4),
  //       contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
  //       leading: Icon(
  //         icon,
  //         color: Colors.black,
  //       ),
  //       minLeadingWidth: 10,
  //       title: Text(title, style: const TextStyle(fontSize: 14)),
  //       trailing:
  //       const Icon(Icons.keyboard_arrow_right_rounded, color: blackColor),
  //       //onTap calls When ListTile Taps
  //       onTap: onTapFunction);
  // }

