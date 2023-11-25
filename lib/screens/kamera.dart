import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survei_asia/screens/verifikasi_ktp.dart';
import 'package:survei_asia/screens/verifikasi_ktp_foto.dart';

// import '../main.dart';
import '../res/theme.dart';

class Kamera extends StatefulWidget {
  const Kamera({Key? key}) : super(key: key);

  @override
  State<Kamera> createState() => _KameraState();
}

class _KameraState extends State<Kamera> {
  late CameraController cameraController;

  @override
  void initState() {
    super.initState();
    cameraController = CameraController(cameras[0], ResolutionPreset.max);
    cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('Kamera tidak diizinkan oleh user');
            break;
          default:
            print('Error lain-lain');
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!cameraController.value.isInitialized) {
      print('Kamera belum diinisialisasi');
      return Container();
    }
    final cameraValue = cameraController.value;
    var screenSize = MediaQuery.of(context).size;
    var scale = screenSize.aspectRatio * cameraValue.aspectRatio;

    if (scale < 1) {
      scale = 1 / scale;
    }
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Verifikasi KTP',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: whiteColor,
          leading: const BackButton(
            color: Color(0xCC000000),
          )),
      backgroundColor: Color(0xCC000000),
      body: Column(
        children: [
          const Spacer(flex: 3),
          ClipRect(
            
              child: Transform.scale(
                    scale: scale,
                    child: CameraPreview(cameraController),
                  )),
          const Spacer(flex: 4),
          Text(
            'Posisikan KTP Anda di dalam kotak di atas dan pastikan hasil foto terbaca degan jelas',
            style: whiteTextStyle.copyWith(fontSize: 14, fontWeight: regular),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          IconButton(
              onPressed: () {
                cameraController.takePicture().then((XFile? file) {
                  if (file != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => VerifikasiKtpFoto(file: file)));
                  }
                });
              },
              icon: SvgPicture.asset('assets/svg/camera-filled.svg'))
        ],
      ),
    );
  }
}
