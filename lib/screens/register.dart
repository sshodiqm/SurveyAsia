import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:survei_asia/res/theme.dart';
import 'package:survei_asia/screens/kebijakan_privasi.dart';
import 'package:survei_asia/widgets/loading_page.dart';
import '../widgets/custom_popup_button.dart';
import 'login.dart';
import 'package:survei_asia/services/api_service.dart';
import 'package:survei_asia/widgets/validator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'syarat_dan_ketentuan.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController nomorController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isButtonActive = false;
  bool isFieldActive = true;

  var errorTxt = null;

  var linkText =
      TextStyle(color: pomegranate, fontWeight: FontWeight.w600, fontSize: 14);
  var defaultText = TextStyle(
      color: Colors.black54, fontWeight: FontWeight.w400, fontSize: 14);

  bool _secureText = true;

  showhide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  bool _secureText2 = true;

  showhide2() {
    setState(() {
      _secureText2 = !_secureText2;
    });
  }

  @override
  void initState() {
    super.initState();

    usernameController.addListener(() {
      nomorController.addListener(() {
        passwordController.addListener(() {
          confirmPasswordController.addListener(() {
            final isButtonActive = usernameController.text.isNotEmpty &&
                nomorController.text.isNotEmpty &&
                passwordController.text.isNotEmpty &&
                confirmPasswordController.text.isNotEmpty;

            setState(() {
              this.isButtonActive = isButtonActive;
            });
          });
        });
      });
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    nomorController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        minimum: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                "Selamat Datang!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Text(
                  "Silahkan mendaftarkan akun Anda untuk menjadi anggota surveyasia",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  maxLines: 2,
                ),
              ),

              //username
              Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Text(
                  "Username",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
              //input username
              TextFormField(
                enabled: isFieldActive,
                controller: usernameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Username tidak boleh kosong";
                  } else if (value.length < 8) {
                    return "Panjang Minimal 8 Karakter";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    hintText: "Masukkan username Anda",
                    contentPadding: EdgeInsets.all(15)),
              ),

              // Email
              Container(
                margin: const EdgeInsets.only(bottom: 5, top: 15),
                child: Text(
                  "Email",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),

              //input Email
              TextFormField(
                enabled: isFieldActive,
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  RegExp regexx = RegExp(
                      r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
                  if (value!.isEmpty) {
                    return "Email tidak boleh kosong";
                  } else if (!regexx.hasMatch(value)) {
                    return "Email tidak valid";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    hintText: 'Masukkan email Anda',
                    contentPadding: EdgeInsets.all(15)),
              ),

              //nomor ponsel
              Container(
                margin: const EdgeInsets.only(bottom: 5, top: 15),
                child: Text(
                  "Nomor ponsel",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),

              //input nomor ponsel
              TextFormField(
                enabled: isFieldActive,
                keyboardType: TextInputType.number,
                controller: nomorController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  //To remove first '0'
                  FilteringTextInputFormatter.deny(RegExp(r'^0+')),
                  LengthLimitingTextInputFormatter(12)
                ],
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukkan nomor ponsel Anda',
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        "+62",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(top: 15, bottom: 15, left: 15)),
              ),

              //Contoh
              Container(
                margin: EdgeInsets.only(top: 2),
                child: Text(
                  'Contoh : +6285245789125',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),

              //kata sandi
              Container(
                margin: EdgeInsets.only(bottom: 5, top: 15),
                child: Text(
                  "Kata sandi",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),

              //input kata sandi
              TextFormField(
                enabled: isFieldActive,
                obscureText: _secureText,
                controller: passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  RegExp regexx = RegExp(
                      r"^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,}$");
                  if (value!.isEmpty) {
                    return "kata sandi tidak boleh kosong";
                  } else if (!regexx.hasMatch(value)) {
                    errorTxt =
                        "Minimal 6 karakter, minimal satu angka, dan karakter khusus";
                    return errorTxt;
                  } else {
                    errorTxt = null;
                    return errorTxt;
                  }
                },
                decoration: InputDecoration(
                    errorText: errorTxt,
                    errorMaxLines: 2,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    hintText: "Masukkan kata sandi Anda",
                    suffixIcon: IconButton(
                      icon: Icon(_secureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        showhide();
                      },
                    ),
                    contentPadding: EdgeInsets.all(15)),
              ),

              //konfirmasi kata sandi
              Container(
                margin: EdgeInsets.only(bottom: 5, top: 15),
                child: Text(
                  "Konfirmasi Kata Sandi",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
              //input konfirmasi kata sandi
              TextFormField(
                enabled: isFieldActive,
                obscureText: _secureText2,
                controller: confirmPasswordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Konfirmasi kata sandi tidak boleh kosong";
                  } else if (passwordController.text !=
                      confirmPasswordController.text) {
                    return "Kata sandi tidak cocok";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    hintText: "Masukkan ulang kata sandi",
                    suffixIcon: IconButton(
                      icon: Icon(_secureText2
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        showhide2();
                      },
                    ),
                    contentPadding: EdgeInsets.all(15)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, left: 5, right: 5),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      style: defaultText,
                      text: 'Dengan membuat akun, Anda menyetujui '),
                  TextSpan(
                      style: linkText,
                      text: 'Syarat dan Ketentuan ',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SyaratDanKetentuan()));
                        }),
                  TextSpan(style: defaultText, text: 'Surveyasia, serta '),
                  TextSpan(
                      style: linkText,
                      text: 'Kebijakan Privasi ',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      KebijakanPrivasi()));
                        }),
                  TextSpan(style: defaultText, text: 'Surveyasia'),
                ])),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 48,
                width: 320,
                child: ElevatedButton(
                  onPressed: isButtonActive
                      ? () {
                          //checkValidation(_formKey);
                          daftar();
                        }
                      : null,
                  child: Text(
                    "Daftar",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: const BackButton(
        color: Colors.black,
      ),
      centerTitle: true,
      title: const Text(
        "Mendaftar",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Future<void> daftar() async {
    if (usernameController.text.isNotEmpty &&
        nomorController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      var noTelp = nomorController.text;
      var password = passwordController.text;
      var username = usernameController.text;
      var confirmPassword = confirmPasswordController.text;
      var email = emailController.text;

      //regex nomor ponsel
      RegExp regex = new RegExp(r'^([0-9])');

      //regex password
      RegExp regexx = new RegExp(
          r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,}$");

      //ValidateSnackBar
      // if (confirmPassword.isEmpty) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //       content: Text("Konfirmasi kata sandi Tidak Boleh Kosong")));
      //   return;
      // } else if (confirmPassword != password) {
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(SnackBar(content: Text("Kata sandi tidak cocok")));
      //   return;
      // } else if (password.isEmpty) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text("Kata sandi Tidak Boleh Kosong")));
      //   return;
      // } else if (password.length < 6) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text("Kata sandi Tidak Boleh Kurang Dari 6")));
      //   return;
      // } else if (noTelp.isEmpty) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text("Nomor ponsel Tidak Boleh Kosong")));
      //   return;
      // } else if (!regex.hasMatch(noTelp)) {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text("Isi nomor ponsel Dengan Valid")));
      //   return;
      // } else if (username.isEmpty) {
      //   ScaffoldMessenger.of(context)
      //       .showSnackBar(SnackBar(content: Text("Nama Tidak Boleh Kosong")));
      //   return;
      // }

      setState(() {
        isButtonActive = false;
        isFieldActive = false;
      });

      BuildContext? showContext;
      showDialog(
        barrierDismissible: false,
        barrierColor: Colors.white.withOpacity(0.2),
        context: context,
        builder: (BuildContext context) {
          showContext = context;
          return const LoadingPage();
        },
      );

      // APIService.registerEmail(username, "62$noTelp", email, password)
      //     .then((value) => {
      //           if (value)
      //             {
      //               //berhasil
      //               registerSuccess()
      //             }
      //           else
      //             {
      //               //gagal
      //               registerFailed(showContext!)
      //             }
      //         });

      //APISERVICE
      APIService.registerEmail(username, "62$noTelp", email, password)
          .then((value) => {
                if (value)
                  {
                    //valid credential
                    registerSuccess()
                  }
                else
                  {registerFailed(showContext!)}
              });
    } else {
      // field blank
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Isi Form Dengan Benar")));
    }
  }

  void registerSuccess() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Register Berhasil")));
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
    usernameController.clear();
    nomorController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  void registerFailed(BuildContext showContext) {
    setState(() {
      isButtonActive = true;
      isFieldActive = true;
    });
    print("Nomor Hp Sudah Digunakan");
    //invalid credential
    CustomPopup(
      img: "assets/svg/illustrations5.svg",
      title: "Gagal Daftar!",
      description:
          "Nomor ponsel atau email yang anda masukan sudah terdaftar, silakan masukan data lain.",
      buttonText1: "Tutup",
      buttonFunction1: (() {
        Navigator.of(showContext).pop();
        Navigator.of(context, rootNavigator: true).pop();
      }),
    ).show(context);
  }

  //CekValidasi
  checkValidation(GlobalKey<FormState> _formKey) {
    if (_formKey.currentState!.validate()) {
      print('Validated');
      int aaaaaa = 1;
    } else {
      print('Not Validated');
    }
  }
}
