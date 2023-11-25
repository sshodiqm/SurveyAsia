import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:survei_asia/res/theme.dart';
import 'package:survei_asia/screens/change_password.dart';
import 'package:survei_asia/screens/ubah_noponsel.dart';
import 'package:survei_asia/screens/ubah_username.dart';

import '../models/response_model.dart';
import '../services/shared_service.dart';

class EditProfil extends StatefulWidget {

  const EditProfil({Key? key}) : super(key: key);

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {

  Data? loginResponse;

  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    var loginData = await SharedService.loginDetails();
    setState(() {
      if (loginData != null) {
        loginResponse = loginData.data[0];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ubah Profil',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                alignment: Alignment.bottomCenter,
                height: 80,
                width: 80,
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage("images/foto_null.png"),
                ),
              ),
            ),
            SizedBox(
              height: 33,
              child: TextButton(
                child: const Text(
                  'Ubah Foto Profil',
                  style: TextStyle(
                      color: pomegranate,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                onPressed: () {},
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 25,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                children: [
                  editProfileContent(
                    'Username',
                    Text('${loginResponse?.username}'),
                    Icons.keyboard_arrow_right_rounded,
                    (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UbahUsername(loginResponse: loginResponse),
                        ),
                      );
                    }),
                  ),
                  editProfileContent(
                    'Nomor Ponsel',
                    Text('+${loginResponse?.telp}'),
                    Icons.keyboard_arrow_right_rounded,
                    (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UbahNoPonsel(loginResponse: loginResponse),
                        ),
                      );
                    }),
                  ),
                  editProfileContent(
                    'Kata Sandi',
                    const Text("●●●●●●●●●"),
                    Icons.keyboard_arrow_right_rounded,
                    (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePassword(noHp: loginResponse?.telp),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget editProfileContent(
    String content,
    Widget title,
    IconData icon,
    Null Function() onPressed,
  ) {
    return ListTile(
      title: title,
      trailing: Icon(icon, color: blackColor),
      leading: Text(content),
      minLeadingWidth: 125,
      onTap: onPressed,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      visualDensity: VisualDensity(vertical: -4),
    );
  }
}
