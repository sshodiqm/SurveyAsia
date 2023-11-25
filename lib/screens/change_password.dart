import 'package:flutter/material.dart';
import 'package:survei_asia/screens/edit_profil.dart';
import 'package:survei_asia/screens/forgot_password.dart';
import 'package:survei_asia/screens/main_screens.dart';
import 'package:survei_asia/screens/password_changed.dart';
import 'package:survei_asia/services/api_service.dart';

import '../models/response_model.dart';
import '../res/theme.dart';
import '../services/shared_service.dart';
import '../widgets/custom_popup_button.dart';

class ChangePassword extends StatefulWidget {
  final String? noHp;

  const ChangePassword({Key? key, this.noHp}) : super(key: key);

  @override
  _ChangePassword createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var currentPasswordController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  late String noHpUser;
  Data? loginResponse;

  bool _showPassword = true;
  bool _showConfirmPassword = true;
  bool _showCurrentPassword = true;
  bool _isPasswordCorrect = false;
  bool _isConfirmPasswordCorrect = false;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    noHpUser = widget.noHp!;
    checkLogin();
  }

  Future<void> checkLogin() async {
    var loginData = await SharedService.loginDetails();
    _isLoggedIn = await SharedService.isLoggedIn();
    print(_isLoggedIn);
    setState(() {
      if (loginData != null) {
        loginResponse = loginData.data[0];
      }
    });
  }

  void toggleCurrentPassword() {
    setState(() {
      _showCurrentPassword = !_showCurrentPassword;
    });
  }

  void togglePassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void toggleConfirmPassword() {
    setState(() {
      _showConfirmPassword = !_showConfirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ubah Kata Sandi',
              style: TextStyle(color: Colors.black)),
          centerTitle: true,
          leading: const BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
        ),
        body: Form(
          key: _formKey,
          child: ListView(children: [
            //Buat Kata Sandi Baru
            Container(
              margin: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),
              child: Text(
                'Buat Kata Sandi Baru',
                textAlign: TextAlign.left,
                style: blackTextStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            //Text
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Text(
                'Kata sandi baru kamu harus berbeda dari kata sandi yang telah digunakan sebelumnya',
                textAlign: TextAlign.left,
                style: blackTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
            //FieldKataSandiSekarang
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: _isLoggedIn ?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only( bottom: 16.0),
                    child: Text(
                      'Kata Sandi Saat Ini',
                      style: blackTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length < 6 ||
                          !value.contains(RegExp(r'[0-9]')) ||
                          !value.contains(RegExp(r'[^\w\d]'))) {
                        return "Minimal 6 karakter, minimal satu angka, dan karakter khusus";
                      }
                      return null;
                    },
                    obscureText: _showCurrentPassword,
                    controller: currentPasswordController,
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                    ),
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintStyle: blackTextStyle.copyWith(
                          fontSize: 14,
                        ),
                        hintText: 'Masukkan Kata Sandi Anda',
                        contentPadding: const EdgeInsets.all(14),
                        suffixIcon: InkWell(
                            onTap: toggleCurrentPassword,
                            child: _showCurrentPassword
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility))),
                  )
                ],
              ) : null,
            ),
            //FieldKataSandiBaru
            Container(
              margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
              child: Text(
                'Kata Sandi Baru',
                style: blackTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    Future.delayed(Duration.zero, () {
                      setState(() {
                        _isPasswordCorrect = false;
                      });
                    });
                  } else if (value!.length < 6 ||
                      !value.contains(RegExp(r'[0-9]')) ||
                      !value.contains(RegExp(r'[^\w\d]'))) {
                    Future.delayed(Duration.zero, () {
                      setState(() {
                        _isPasswordCorrect = false;
                      });
                    });
                    return "Minimal 6 karakter, minimal satu angka, dan karakter khusus";
                  } else {
                    Future.delayed(Duration.zero, () {
                      setState(() {
                        _isPasswordCorrect = true;
                      });
                    });
                  }
                  return null;
                },
                obscureText: _showPassword,
                controller: passwordController,
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintStyle: blackTextStyle.copyWith(
                      fontSize: 14,
                    ),
                    hintText: 'Masukkan Kata Sandi',
                    contentPadding: const EdgeInsets.all(14),
                    suffixIcon: InkWell(
                        onTap: togglePassword,
                        child: _showPassword
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility))),
              ),
            ),

            //FieldKonfirmasiKataSandiBaru
            Container(
              margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0, bottom: 8.0),
              child: Text(
                'Konfirmasi Kata Sandi',
                style: blackTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    Future.delayed(Duration.zero, () {
                      setState(() {
                        _isConfirmPasswordCorrect = false;
                      });
                    });
                  } else if (passwordController.value !=
                      confirmPasswordController.value) {
                    Future.delayed(Duration.zero, () {
                      setState(() {
                        _isConfirmPasswordCorrect = false;
                      });
                    });
                    return "Kata sandi tidak cocok";
                  } else if (passwordController.value ==
                      confirmPasswordController.value) {
                    Future.delayed(Duration.zero, () {
                      setState(() {
                        _isConfirmPasswordCorrect = true;
                      });
                    });
                    return null;
                  }
                },
                obscureText: _showConfirmPassword,
                controller: confirmPasswordController,
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintStyle: blackTextStyle.copyWith(
                      fontSize: 14,
                    ),
                    hintText: 'Masukkan Kata Sandi',
                    contentPadding: const EdgeInsets.all(14),
                    suffixIcon: InkWell(
                        onTap: toggleConfirmPassword,
                        child: _showConfirmPassword
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility))),
              ),
            ),

            //Lupa Sandi
            Container(
              margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: _isLoggedIn ? InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ForgotPassword(); //-> simpan password baru
                  }));
                },
                child: Text(
                  'Lupa Kata Sandi?',
                  style: pomegrateTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ) : null,
            ),

            //ButtonSimpan
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              width: double.infinity,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: ElevatedButton(
                  onPressed: _isPasswordCorrect && _isConfirmPasswordCorrect
                      ? () {
                    if(_isLoggedIn){
                      if (loginResponse?.password == currentPasswordController.text){
                        updatePassword();
                      } else {
                        CustomPopup(
                          img: "assets/svg/illustrations5.svg",
                          title: "Terjadi Kesalahan!",
                          description:
                          "Kata sandi lama yang Anda masukkan salah. Silahkan coba lagi.",
                          buttonText1: "Coba Lagi",
                          buttonFunction1: (() {
                            Navigator.of(context, rootNavigator: true).pop();
                          }),
                        ).show(context);
                      }
                    } else {
                      updatePassword();
                    }
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pomegranate,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    "Simpan",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }

  checkValidation(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      print('Validated');
      int aaaaaa = 1;
      return true;
    } else {
      print('Not Validated');
      return false;
    }
  }

  Future<void> updatePassword() async {
    var password = confirmPasswordController.text;

    print(noHpUser);
    APIService.changePassword(noHpUser, password).then((value) =>
    {
      if (value)
        {
          if(_isLoggedIn){
            CustomPopup(
              title: 'Yeay! Berhasil diubah',
              description: 'Sandi Anda berhasil diubah',
              buttonText1: 'OK',
              img: 'assets/svg/popup_success.svg',
              buttonFunction1: () {
                Navigator.of(context, rootNavigator: true)
                    ..pop()
                    ..pop();
              },
            ).show(context)
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const PasswordChanged(); //-> simpan password baru
            }))
          }
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
