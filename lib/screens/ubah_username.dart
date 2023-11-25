import 'package:flutter/material.dart';
import 'package:survei_asia/screens/edit_profil.dart';
import 'package:survei_asia/screens/main_screens.dart';
import 'package:survei_asia/widgets/custom_popup_button.dart';

import '../models/response_model.dart';
import '../services/api_service.dart';

class UbahUsername extends StatefulWidget {
  const UbahUsername({Key? key, this.loginResponse}) : super(key: key);

  final Data? loginResponse;

  @override
  State<UbahUsername> createState() => _UbahUsernameState();
}

class _UbahUsernameState extends State<UbahUsername> {

  Data get loginResponse => widget.loginResponse!;
  TextEditingController usernameController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    usernameController.text = loginResponse.username;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ubah Username',
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
                    'Username',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder()),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                MaterialButton(
                  onPressed: () {
                    updateUsername();
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


  Future<void> updateUsername() async {
    var username = usernameController.text;
    APIService
        .updateUsername(loginResponse.id, username)
        .then((value) =>
    {
      if (value)
        {
          CustomPopup(
            title: 'Yeay! Berhasil diubah',
            description: 'Username Anda berhasil diubah',
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
