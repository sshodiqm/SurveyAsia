import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survei_asia/res/theme.dart';

class TentangAplikasi extends StatefulWidget {
  const TentangAplikasi({Key? key}) : super(key: key);

  @override
  _TentangAplikasi createState() => _TentangAplikasi();
}

class _TentangAplikasi extends State<TentangAplikasi> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.deepOrange;
    }

    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  width: double.infinity,
                  height: 130,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage('images/tentang_aplikasi_bg.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  height: 70,
                  child: const Image(
                    fit: BoxFit.fill,
                    image: AssetImage("images/image1.png"),
                  ),
                ),
              ],
            ),

            //Text
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Text(
                "Misi & Visi",
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const Divider(
              color: diamondOrange,
              height: 20,
              indent: 120,
              endIndent: 120,
              thickness: 2,
            ),

            Container(
              margin: const EdgeInsets.only(left: 20, top: 24),
              child: Text(
                "Misi",
                style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: diamondOrange),
                textAlign: TextAlign.left,
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 4, left: 20, right: 20),
              child: Text(
                "Surveyasia.id membantu individu maupun perusahaan dengan memberikan solusi melalui hasil riset yang cepat, dapat diandalkan, dan berwawasan luas yang akan membawa kepada seuah keputusan yang lebih baik.",
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                ),
                textAlign: TextAlign.justify,
              ),
            ),

            Container(
              margin: const EdgeInsets.only(left: 20, top: 24),
              child: Text(
                "Visi",
                style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: diamondOrange),
                textAlign: TextAlign.left,
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 4, left: 20, right: 20),
              child: Text(
                "Menjadi platform riset online terbaik bagi individu maupun perusahaan.",
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                ),
                textAlign: TextAlign.justify,
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Text(
                "Informasi Kontak",
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const Divider(
              color: diamondOrange,
              height: 20,
              indent: 120,
              endIndent: 120,
              thickness: 2,
            ),

            Container(
              margin: const EdgeInsets.only(top: 24, left: 20, right: 20),
              child: Column(
                children: [
                  //Kantor
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: SvgPicture.asset(
                          'assets/svg/lokasi.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      Flexible(
                        flex: 5,
                        child: Container(
                          margin: const EdgeInsets.only(left: 16),
                          width: 300,
                          child: Text(
                            "Graha Mustika Ratu 5th Floor 503, Tebet, Jakarta Selatan 12870",
                            style: greyTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  //Email
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: SvgPicture.asset(
                          'assets/svg/lokasi.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      Flexible(
                        flex: 5,
                        child: Container(
                          margin: const EdgeInsets.only(left: 16),
                          width: 300,
                          child: Text(
                            "info@citiasiainc.id",
                            style: greyTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  //Email
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: SvgPicture.asset(
                          'assets/svg/telepon.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      Flexible(
                        flex: 5,
                        child: Container(
                          margin: const EdgeInsets.only(left: 16),
                          width: 300,
                          child: Text(
                            "021-8370-7143",
                            style: greyTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  //Telphone
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: SvgPicture.asset(
                          'assets/svg/pesan.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      Flexible(
                        flex: 5,
                        child: Container(
                          margin: const EdgeInsets.only(left: 16),
                          width: 300,
                          child: Text(
                            "021-8370-5680",
                            style: greyTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: const BackButton(
        color: Colors.black,
      ),
      title: Text(
        'Tetang Aplikasi',
        style: blackTextStyle.copyWith(
          fontWeight: bold,
          fontSize: 16,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }
}
