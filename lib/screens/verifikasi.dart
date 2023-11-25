import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:survei_asia/res/theme.dart';
import 'package:survei_asia/screens/change_password.dart';
import 'package:survei_asia/services/shared_service.dart';
import 'package:twilio_phone_verify/twilio_phone_verify.dart';

import '../widgets/custom_popup_button.dart';

class Verifikasi extends StatefulWidget {
  final String noHp;
  final TwilioPhoneVerify twilioPhoneVerify;

  const Verifikasi(
      {Key? key, required this.noHp, required this.twilioPhoneVerify})
      : super(key: key);

  @override
  _Verifikasi createState() => _Verifikasi();
}

class _Verifikasi extends State<Verifikasi> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String noHpUser;
  late TwilioPhoneVerify twilioPhoneVerify;
  late String otpCode;
  bool isEditing = true;
  bool countdownStatus = false;
  int resendCount = 0;
  var arrDuration = [1,3,5,10];

  @override
  void initState() {
    super.initState();
    noHpUser = widget.noHp;
    print("verifikasi $noHpUser");
    twilioPhoneVerify = widget.twilioPhoneVerify;
    countdownStatus = true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Verifikasi',
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
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  SvgPicture.asset(
                    "assets/svg/illustrations11.svg",
                    width: 215,
                    height: 196,
                  ),
                  //Text
                  Container(
                    margin: const EdgeInsets.only(top: 32.0),
                    child: const Text(
                      'Masukkan kode OTP 6 digit',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),

                  //Text
                  Container(
                    margin: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                    child: Text(
                      'Kode OTP Anda telah dikirimkan melalui SMS ke +$noHpUser',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: greyColor),
                    ),
                  ),

                  Center(
                    child: VerificationCode(
                      length: 6,
                      textStyle: TextStyle(fontSize: 20),
                      underlineColor: Colors.blueAccent,
                      keyboardType: TextInputType.number,
                      onCompleted: (value) {
                        setState(() {
                          otpCode = value;
                        });
                      },
                      onEditing: (value) {
                        setState(() {
                          isEditing = value;
                        });
                        if (!isEditing) FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      if (!countdownStatus) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Tidak menerima OTP?",
                              style: TextStyle(
                                  fontSize: 14, color: Color.fromRGBO(78, 87, 92, 1)),
                            ),
                            TextButton(
                                onPressed: () {
                                  checkResend();
                                },
                                child: const Text(
                                  "Kirim ulang",
                                  style: TextStyle(color: pomegranate, fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ] else ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Mohon tunggu dalam",
                              style: TextStyle(
                                  fontSize: 14, color: Color.fromRGBO(78, 87, 92, 1)),
                            ),
                            SlideCountdown(
                              duration: Duration(minutes: arrDuration[resendCount]),
                              textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              decoration: BoxDecoration(color: Colors.white),
                              shouldShowMinutes: (p0) {
                                return true;
                              },
                              shouldShowSeconds: (p0) {
                                return true;
                              },
                              onDone: () {
                                setState(() {
                                  countdownStatus = false;
                                  resendCount++;
                                });
                              },
                            ),
                          ],
                        ),
                        Text(
                          "untuk kirim ulang kode",
                          style: TextStyle(
                              fontSize: 14, color: Color.fromRGBO(78, 87, 92, 1)),
                          maxLines: 2,
                        )
                      ]
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     onSurface: Colors.blue,
                  //     primary: Colors.deepOrange,
                  //     padding: EdgeInsets.only(right: 139, left: 139)
                  //   ),
                  //   onPressed: () {
                  //
                  //   },
                  //   child: Text("Verifikasi", style: TextStyle(color: Colors.white),)
                  // )

                  MaterialButton(
                    onPressed: () {
                      verifyCode();
                    },
                    color: Colors.deepOrange,
                    minWidth: double.infinity,
                    height: 50,
                    child: Text(
                      "Verifikasi",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void checkResend() {
    if(resendCount > (arrDuration.length-1)) {
      CustomPopup(
        img: "assets/svg/illustrations5.svg",
        title: "Gagal Mengirim OTP!",
        description:
        "Nomor ponsel sudah melebihi limit untuk mengirim OTP, silakan tunggu beberapa saat lagi",
        buttonText1: "Tutup",
        buttonFunction1: (() {
          Navigator.of(context, rootNavigator: true).pop();
        }),
      ).show(context);
    } else {
      resendOTP();
    }
  }

  Future<void> verifyCode() async {
    if (otpCode.length == 6 && isEditing == false) {
      print(otpCode);

      TwilioResponse twilioResponse = await twilioPhoneVerify.verifySmsCode(
          phone: "+$noHpUser", code: otpCode);

      //check if there connection successful
      if (twilioResponse.successful!) {

        //check if the code is approve or not
        if (twilioResponse.verification?.status ==
            VerificationStatus.approved) {
          SharedService.setIsLoggedIn(false);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ChangePassword(noHp: noHpUser);
          }));
        } else {
          CustomPopup(
            img: "assets/svg/illustrations5.svg",
            title: "Kode OTP Salah!",
            description:
            "Kode yang anda masukan salah, silakan periksa kembali kode yang sudah dikirimkan ke nomor anda.",
            buttonText1: "Tutup",
            buttonFunction1: (() {
              Navigator.of(context, rootNavigator: true).pop();
            }),
          ).show(context);
        }
        //////

      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("${twilioResponse.errorMessage}")));
      }

    } else {
      CustomPopup(
        img: "assets/svg/illustrations5.svg",
        title: "Kode OTP Invalid!",
        description:
        "Kode yang anda masukan kurang dari 6, silakan periksa kembali kode yang sudah dikirimkan ke nomor anda.",
        buttonText1: "Tutup",
        buttonFunction1: (() {
          Navigator.of(context, rootNavigator: true).pop();
        }),
      ).show(context);
    }
  }

  Future<void> resendOTP() async {
    print("Resend OTP to $noHpUser");

    TwilioResponse twilioResponse =
        await twilioPhoneVerify.sendSmsCode("+$noHpUser");

    if (twilioResponse.successful!) {
      print("send code success");
      setState(() {
        countdownStatus = true;
      });
    } else {
      print("Twilio Response Error : ${twilioResponse.errorMessage}");
      CustomPopup(
        img: "assets/svg/illustrations5.svg",
        title: "Terjadi Kesalahan!",
        description:
        "Terjadi kesalahan saat mengirimkan kode OTP, silakan coba beberapa saat lagi. \n\nError Message: ${twilioResponse.errorMessage}",
        buttonText1: "Tutup",
        buttonFunction1: (() {
          Navigator.of(context, rootNavigator: true).pop();
        }),
      ).show(context);
    }
  }
}
