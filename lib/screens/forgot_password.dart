import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survei_asia/res/theme.dart';
import 'package:survei_asia/screens/login.dart';
import 'package:survei_asia/screens/register.dart';
import 'package:survei_asia/screens/verifikasi.dart';
import 'package:survei_asia/services/api_service.dart';
import 'package:twilio_phone_verify/twilio_phone_verify.dart';

import '../widgets/custom_popup_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPassword createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  TextEditingController phoneController = TextEditingController();
  late TwilioPhoneVerify twilioPhoneVerify;

  bool _isCorrect = false;

  @override
  void initState() {
    super.initState();

    //replace here (minta ke Galih) // kalo gabisa salahin twilio nya :(
    twilioPhoneVerify = TwilioPhoneVerify(
        accountSid: 'AC9a1e35bb15d2dc84671b852791635aa1',
        serviceSid: 'VAb03e1c2fa04843226d34fc6143717476',
        authToken: '1c0f262dbb6eff308b93085562827840');
    //until here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lupa Kata Sandi',
              style: TextStyle(color: Colors.black)),
          centerTitle: true,
          leading: const BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.fromLTRB(16, 55, 16, 16),
            child: ListView(
              children: [
                SvgPicture.asset(
                  "assets/svg/illustrations8.svg",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.27,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: const Text(
                    'Kami akan mengirimkan kode OTP ke nomor ponsel Anda untuk mereset kata sandi',
                    textAlign: TextAlign.left,
                  ),
                ),
                const Text(
                  'Nomor Ponsel',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    controller: phoneController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      RegExp regex = RegExp(r'^\+?\d{8,13}$');
                      if (value!.isEmpty) {
                        Future.delayed(Duration.zero, () {
                          setState(() {
                            _isCorrect = false;
                          });
                        });
                        return "Nomor Ponsel Tidak Boleh Kosong";
                      } else if (!regex.hasMatch(value)) {
                        Future.delayed(Duration.zero, () {
                          setState(() {
                            _isCorrect = false;
                          });
                        });
                        return "Nomor ponsel harus 8 sampai 13 digit";
                      } else {
                        Future.delayed(Duration.zero, () {
                          setState(() {
                            _isCorrect = true;
                          });
                        });

                        return null;
                      }
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                      //To remove first '0'
                      FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                      LengthLimitingTextInputFormatter(12)
                    ],
                    decoration: const InputDecoration(
                      hintText: 'Masukan Nomor Ponsel Anda',
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "+62",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Text(
                    'Contoh : +6285245789125',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _isCorrect
                        ? () {
                            verify();
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      primary: pomegranate,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      "Kirim",
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> verify() async {
    RegExp regex = new RegExp(r'^([1-9][1-9][1-9][1-9])');
    var telp = phoneController.text.trim();

    telp = "62$telp";

    print(telp);

    APIService.checkPhoneNumber(telp).then((response) => {
          if (response)
            {sendCodeOTP(telp)}
          else
            {
              CustomPopup(
                img: "assets/svg/illustrations5.svg",
                title: "Tidak Terdaftar!",
                description:
                    "Nomor ponsel Anda tidak terdaftar.\n Silakan melakukan pendaftaran.",
                buttonText1: "Daftar",
                buttonFunction1: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return RegisterScreen();
                  }));
                },
                buttonText2: "Tutup",
                buttonFunction2: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ).show(context)
            }
        });
  }

  Future<void> sendCodeOTP(String telp) async {
    print("Start Sending Code to $telp");
    TwilioResponse twilioResponse =
        await twilioPhoneVerify.sendSmsCode("+$telp");

    if (twilioResponse.successful!) {
      print("send code success");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Kode Sudah Dikirim Silahkan Periksa SMS Kamu")));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Verifikasi(
                  noHp: telp, twilioPhoneVerify: twilioPhoneVerify)));
    } else {
      print("Twilio Response Error : ${twilioResponse.errorMessage}");
      CustomPopup(
        img: "assets/svg/illustrations5.svg",
        title: "Terjadi Kesalahan!",
        description:
            "Terjadi kesalahan saat mengirimkan kode OTP, silakan coba beberapa saat lagi. \n\nError : ${twilioResponse.errorMessage}",
        buttonText1: "Tutup",
        buttonFunction1: (() {
          Navigator.of(context, rootNavigator: true).pop();
        }),
      ).show(context);
    }
  }
}
