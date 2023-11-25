import 'package:flutter/material.dart';
import 'package:survei_asia/models/response_model.dart';

import '../services/api_service.dart';
import '../widgets/custom_popup_button.dart';
import 'edit_profil.dart';

class UbahNoPonsel extends StatefulWidget {
  const UbahNoPonsel({Key? key, this.loginResponse}) : super(key: key);

  final Data? loginResponse;

  @override
  State<UbahNoPonsel> createState() => _UbahNoPonselState();
}

class _UbahNoPonselState extends State<UbahNoPonsel> {

  Data get loginResponse => widget.loginResponse!;
  TextEditingController noPonselController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    noPonselController.text = loginResponse.telp.substring(2);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ubah Nomor Ponsel',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Form(
          child: Form(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0, bottom: 8),
                  child: const Text(
                    'Nomor Ponsel',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: TextFormField(
                    controller: noPonselController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            "+62",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        hintText: '85123456789'),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                MaterialButton(
                  onPressed: () {
                    updateTelp();
                  },
                  color: Colors.deepOrange,
                  minWidth: double.infinity,
                  height: 50,
                  child: Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> updateTelp() async {
    var telp = '62${noPonselController.text}';
    APIService
        .updateTelp(loginResponse.id, telp)
        .then((value) =>
    {
      if (value)
        {
          CustomPopup(
            title: 'Yeay! Berhasil diubah',
            description: 'No Ponsel Anda berhasil diubah',
            buttonText1: 'OK',
            img: 'assets/svg/popup_success.svg',
            buttonFunction1: () {
              Navigator.of(context, rootNavigator: true)
                ..pop()
                ..pop()
                ..pop()
                ..push(
                    MaterialPageRoute(
                        builder: (BuildContext context) => const EditProfil()));
            },
          ).show(context)
        }
      else
        {
          CustomPopup(
            img: "assets/svg/illustrations5.svg",
            title: "Terjadi Kesalahan!",
            description:
            "Terjadi kesalahan saat mengubah password anda, silakan coba beberapa saat lagi.",
            buttonText1: "Tutup",
            buttonFunction1: (() {
              Navigator.of(context, rootNavigator: true).pop();
            }),
          ).show(context)
        }
    });
  }
}
