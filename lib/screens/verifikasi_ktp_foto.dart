import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:survei_asia/screens/kamera.dart';
import 'package:survei_asia/screens/verifikasi_ktp_proses.dart';

import '../res/theme.dart';

class VerifikasiKtpFoto extends StatefulWidget {
  const VerifikasiKtpFoto({Key? key, required this.file}) : super(key: key);
  final XFile file;

  @override
  State<VerifikasiKtpFoto> createState() => _VerifikasiKtpFotoState();
}

class _VerifikasiKtpFotoState extends State<VerifikasiKtpFoto> {
  late XFile file;

  @override
  void initState() {
    file = widget.file;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Verifikasi KTP',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: whiteColor,
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(height: 60),
            Container(
              width: 320,
              height: 196,
              child: AspectRatio(aspectRatio: 320/196, child: Image.file(File(file.path))),
            ),
            const SizedBox(height: 284),
            Row(children: [
              SizedBox(width: MediaQuery.of(context).size.width * 1 / 18),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VerifikasiKtpProses()));
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
                  child: Text('Verifikasi',
                      style: whiteTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w600))),
              SizedBox(width: MediaQuery.of(context).size.width * 1 / 18),
            ]),
            const SizedBox(height: 14),
            Row(children: [
              SizedBox(width: MediaQuery.of(context).size.width * 1 / 18),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Kamera()));
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll<Color>(whiteColor),
                      shape: MaterialStatePropertyAll<OutlinedBorder>(
                          RoundedRectangleBorder(
                              side: const BorderSide(color: pomegranate),
                              borderRadius: BorderRadius.circular(6))),
                      fixedSize: MaterialStatePropertyAll<Size>(
                          Size(MediaQuery.of(context).size.width * 8 / 9, 48))),
                  child: Text('Ambil Ulang',
                      style: pomegrateTextStyle.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w600))),
              SizedBox(width: MediaQuery.of(context).size.width * 1 / 18),
            ]),
            const SizedBox(height: 50)
          ],
        )));
  }
}
