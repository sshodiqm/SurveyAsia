import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../res/theme.dart';

class PengisianSurveySelesai extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Survey",
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: pomegranate,
        elevation: 1,
      ),
       
      body: SingleChildScrollView(
        child : Container(
          padding: EdgeInsets.all(20),
        alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Image.asset(
                "images/checklist.png",
                height: 150,
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Thank You !",
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  "Your submission has been received. Keep an eye on your email for our ideas",
                  textAlign: TextAlign.center,
                  style: blackTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        ) 
      
    );
  }
}
