import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const infopribadi());
}

class infopribadi extends StatefulWidget {
  const infopribadi({Key? key}) : super(key: key);

  @override
  State<infopribadi> createState() => _infopribadiState();
}

class _infopribadiState extends State<infopribadi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.only(left: 20, right: 20),
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: SvgPicture.asset("assets/svg/daftarsukses.svg"),
              ),
              Container(
                child: Text("Selamat datang di Surveyasia",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text("Silahkan mengisi informasi pribadi dan dapatkan poin pertamamu",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 320,
                height: 48,
                child: ElevatedButton(onPressed: (){},
                  child: Text("Lanjutkan",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                width: 320,
                height: 48,
                child: OutlinedButton(onPressed: (){},
                  child: Text("Nanti Saja",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.deepOrange),
                  ),
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.deepOrange),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

