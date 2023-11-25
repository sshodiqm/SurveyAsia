import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survei_asia/res/theme.dart';
import 'package:survei_asia/screens/register.dart';
import 'package:survei_asia/screens/tukar_poin_nominal.dart';
import 'package:survei_asia/services/api_service.dart';
import 'package:survei_asia/services/shared_service.dart';
import 'package:survei_asia/utils/authentication.dart';
import 'package:survei_asia/widgets/custom_popup_button.dart';
import 'package:survei_asia/widgets/facebook_sign_in_button.dart';
import 'package:survei_asia/widgets/google_sign_in_button.dart';
import 'package:survei_asia/widgets/linkedIn_sing_in_button.dart';

import '../widgets/loading_page.dart';
import 'forgot_password.dart';
import 'main_screens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool isChecked = false;

  bool isButtonActive = false;

  bool _secureText = true;


  int charLength = 0;
  bool example = true;

  _onChanged(String value) {
    setState(() {
      charLength = value.length;
    });

    if (charLength >= 1) {
      setState(() {
        example = false;
      });
    } else {
      setState(() {
        example = true;
      });
    }
  }

  showhide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  @override
  void initState() {
    super.initState();
    checkInput();
    checkUserData();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void checkUserData() async {
    var loginStatus = await SharedService.isLoggedIn();
    if (loginStatus) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainScreens()),
          (route) => false);
    }
  }

  void checkInput() {
    emailController.addListener(() {
      passwordController.addListener(() {
        final isButtonActive = emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty;

        setState(() {
          this.isButtonActive = isButtonActive;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Form(
          key: _formKey,
          child: ListView(children: [
            //Text
            const Text(
              'Selamat Datang!',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),

            //Text
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: const Text(
                'Masukkan email dan kata sandi Anda yang telah terdaftar',
                textAlign: TextAlign.left,
              ),
            ),

            //Nomer Ponsel
            Container(
              margin: const EdgeInsets.only(bottom: 4),
              child: const Text(
                'Email',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //input Email
            TextFormField(
              controller: emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: _onChanged,
              validator: (value) {
                RegExp regexx = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
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

            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: example,
              child: Container(
                margin: EdgeInsets.only(top: 2, bottom: 20),
                child: Text(
                  'Contoh : citiasia@gmail.com',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),

            //Kata Sandi
            const Text(
              'Kata Sandi',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            //Field Kata Sandi
            Container(
              padding: const EdgeInsets.only(top: 4, bottom: 8),
              child: TextFormField(
                obscureText: _secureText,
                controller: passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password Tidak Boleh Kosong";
                  } else if (value!.length < 6) {
                    return "Password Tidak Boleh Kurang Dari 6";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(16),
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan kata sandi Anda',
                  suffixIcon: IconButton(
                    icon: Icon(
                        _secureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      showhide();
                    },
                  ),
                  suffixIconConstraints:
                      BoxConstraints(minWidth: 20, minHeight: 20),
                ),
              ),
            ),

            //Ingat saya & Lupa Kata Sandi
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPassword()));
                },
                child: const Text(
                  "Lupa Kata Sandi?",
                  style: TextStyle(
                      color: Colors.deepOrange, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //ButtonMasuk
            Container(
              margin: const EdgeInsets.only(top: 30.0, bottom: 20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrange,
                  ),
                  onPressed: isButtonActive
                      ? () {
                          checkValidation(_formKey);
                          login();
                        }
                      : null,
                  child: const Text(
                    "Masuk",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ),

            //Text
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      height: 4,
                      thickness: 1,
                      indent: 2,
                      endIndent: 2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    child: Text(
                      'Atau masuk menggunakan',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                      height: 4,
                      thickness: 1,
                      indent: 2,
                      endIndent: 2,
                    ),
                  ),
                ],
              ),
            ),

            //ThirdPartySign
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: Authentication.initializeFirebase(context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Error initializing Firebase');
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return GoogleSignInButton();
                    }
                    return CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        diamondOrange,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                const LinkedinSignInButton(),
                const SizedBox(
                  width: 10,
                ),
                const FacebookSignInButton()
              ],
            ),

            //ButtonRegister
            const SizedBox(height: 2.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Belum punya akun?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 2),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: const Text(
                      "Daftar",
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Masuk',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }

  Future<void> login() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var password = passwordController.text;
      var email = emailController.text;

      //ValidateSnackBar
      if (password.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Password Tidak Boleh Kosong")));
        return;
      } else if (password.length < 6) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Password Tidak Boleh Kurang Dari 6")));
        return;
      } else if (email.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("No Telpon Tidak Boleh Kosong")));
        return;
      } else if (password.isEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Nama Tidak Boleh Kosong")));
        return;
      }

      setState(() {
        isButtonActive = false;
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

      await APIService.loginEmail(email, password).then(
        (response) => {
          if (response)
            {
              //valid credential
              loginSuccess(),
            }
          else
            {
              //invalid credential
              loginFailed(showContext!)
            }
        },
      );

      // await APIService.loginTelp(noTelp, password).then(
      //   (response) => {
      //     if (response)
      //       {
      //         //valid credential
      //         loginSuccess(),
      //       }
      //     else
      //       {
      //         //invalid credential
      //         loginFailed(showContext!)
      //       }
      //   },
      // );
    } else {
      // field blank
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Isi Form Dengan Benar")));
    }
  }

  Future<void> loginSuccess() async {
    var data = await SharedService.loginDetails();
    if (data != null) {
      APIService.getUserInfo(data.data[0].id).then((response) => {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => MainScreens(
                          index: 0,
                        )),
                (route) => false)
          });
    }
  }

  void loginFailed(BuildContext showContext) {
    CustomPopup(
      img: "assets/svg/illustrations5.svg",
      title: "Gagal Masuk!",
      description:
          "Email atau kata sandi yang Anda masukkan salah. Silahkan coba kembali.",
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
