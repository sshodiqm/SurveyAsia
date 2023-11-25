import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survei_asia/res/theme.dart';
import 'package:survei_asia/screens/kamera.dart';

late List<CameraDescription> cameras;

// Untuk testing
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  print(cameras);
  runApp(MaterialApp(home: VerifikasiKtp()));
}

class VerifikasiKtp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verifikasi KTP', style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: whiteColor,
        leading: const BackButton(
          color: Colors.black,
        ),

      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
        children: [
          // Title and Subtitle
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                const SizedBox(height: 28),
                Text('Verifikasi KTP Anda',
                    style: blackTextStyle.copyWith(
                        fontSize: 24, fontWeight: FontWeight.w600)),
                Text('Foto KTP Anda seperti contoh di bawah ini',
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: regular)),
              ],
            ),
          ),
          const SizedBox(height: 52),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                    child: Text('Panduan Foto KTP',
                    style: secondBlackTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium))),
                Row(
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Container(
                      width: 140,
                      height: 100,
                      color: lightGrey,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 13,
                            right: 10,
                            bottom: 12,
                            left: 10,
                            child: Image.asset('images/ktp.png'),
                          ),
                          Positioned(
                              top: 6,
                              right: 6,
                              child: SvgPicture.asset('assets/svg/yes.svg')),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Container(
                      width: 140,
                      height: 100,
                      color: lightGrey,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 57,
                            left: 36,
                            child: Image.asset('images/ktp.png'),
                          ),
                          Positioned(
                              top: 6,
                              right: 6,
                              child: SvgPicture.asset('assets/svg/no.svg')),
                        ],
                      ),
                    ),
                    const Spacer(flex: 1)
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          // Syarat-syarat
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                        flex: 1, child: SvgPicture.asset('assets/svg/yes.svg')),
                    Flexible(
                        flex: 6,
                        child: Text(
                          'KTP asli bukan hasil scan atau fotocopy',
                          style: secondBlackTextStyle.copyWith(
                              fontSize: 14, fontWeight: regular),
                        ))
                  ],
                ),
                const SizedBox(height: 4,),
                Row(
                  children: [
                    Flexible(
                        flex: 1, child: SvgPicture.asset('assets/svg/yes.svg')),
                    Flexible(
                        flex: 6,
                        child: Text(
                          'KTP atas nama Anda, bukan milik orang lain',
                          style: secondBlackTextStyle.copyWith(
                              fontSize: 14, fontWeight: regular),
                        ))
                  ],
                ),
                const SizedBox(height: 4,),
                Row(
                  children: [
                    Flexible(
                        flex: 1, child: SvgPicture.asset('assets/svg/yes.svg')),
                    Flexible(
                        flex: 6,
                        child: Text(
                          'Pastikan foto tidak terpotong atau tertutupi',
                          style: secondBlackTextStyle.copyWith(
                              fontSize: 14, fontWeight: regular),
                        ))
                  ],
                ),
                const SizedBox(height: 4,),
                Row(
                  children: [
                    Flexible(
                        flex: 1, child: SvgPicture.asset('assets/svg/yes.svg')),
                    Flexible(
                        flex: 6,
                        child: Text(
                          'Pastikan foto jelas dan tidak blur',
                          style: secondBlackTextStyle.copyWith(
                              fontSize: 14, fontWeight: regular),
                        ))
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 159),
          Row(children: [
            SizedBox(width: MediaQuery.of(context).size.width * 1 / 18),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Kamera()));
                },
                style: ButtonStyle(
                    backgroundColor:
                    const MaterialStatePropertyAll<Color>(pomegranate),
                    shape: MaterialStatePropertyAll<OutlinedBorder>(
                        RoundedRectangleBorder(
                            side: const BorderSide(color: pomegranate),
                            borderRadius: BorderRadius.circular(6))),
                    fixedSize: MaterialStatePropertyAll<Size>(
                        Size(MediaQuery.of(context).size.width * 8 / 9, 48))),
                child: Text('Selanjutnya',
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w600))),
            SizedBox(width: MediaQuery.of(context).size.width * 1 / 18),
          ]),
          const SizedBox(height: 50,)
        ],
      ))),
    );
  }
}
