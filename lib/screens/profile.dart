import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:survei_asia/screens/data_pribadi.dart';
import 'package:survei_asia/screens/edit_profil.dart';
import 'package:survei_asia/screens/informasi_pribadi.dart';
import 'package:survei_asia/screens/kebijakan_privasi.dart';
import 'package:survei_asia/screens/tentang_aplikasi.dart';
import '../models/response_model.dart';
import '../models/response_userinfo_model.dart';
import '../services/shared_service.dart';
import '../widgets/custom_popup_button.dart';
import 'login.dart';
import 'register.dart';
import 'package:survei_asia/res/theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Data? loginResponse;
  bool isUserInfoFilled = false;
  bool isLoggedIn = false;
  String? iconString;
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    var loginData = await SharedService.loginDetails();
    setState(() {
      if (loginData != null) {
        loginResponse = loginData.data[0];
        isLoggedIn = true;
        print(loginResponse);
        print('telah login ' + isLoggedIn.toString());
        checkUserInfo();
      } else {
        print("Profile: No Data, Please Login");
        iconString = null;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
  }

  Future<void> checkUserInfo() async {
    var userInfo = await SharedService.userInfo();
    setState(() {
      if (userInfo != null) {
        isUserInfoFilled = true;
        iconString = null;
        print('udah ngisi ' + isUserInfoFilled.toString());
      } else {
        iconString = 'assets/svg/warning_red.svg';
      }
    });
  }

  Future<void> logout() async {
    await SharedService.logout();
    setState(() {
      isLoggedIn = false;
      iconString = null;
    });
    checkLogin();
  }

  Future<void> _openWhatsAppChat() async {
    // String phoneNumber = '6281991848420';
    String userName = 'said.shodiqmufadhol';
    var url = 'https://m.me/$userName';
    // var url = 'https://m.me/$userName?text=Halo, admin.., saya ingin bertanya';
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Profil",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView(
        children: [
          (isLoggedIn) ? sudahLogin(context) : masukAndDaftar(context),
          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
            child: const Text(
              'Informasi',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          ProfileContent(
            icon2: iconString,
            icon: Icons.perm_identity,
            title: 'Informasi Pribadi',
            onTapFunction: () {
              if (isLoggedIn) {
                if (isUserInfoFilled) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PersonalInfoScreen(
                              loginResponse: loginResponse)));
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DataPribadi()));
                }
              } else {
                LoginScreen();
              }
            },
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 9.5),
            child: const Text(
              'Pusat Bantuan',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          ProfileContent(
            icon: Icons.chat_bubble_outline_rounded,
            title: 'Chat dengan Surveyasia',
            onTapFunction: () {
              _openWhatsAppChat();
            },
          ),
          ProfileContent(
            icon: Icons.info_outline_rounded,
            title: 'Tentang Aplikasi',
            onTapFunction: () {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => TentangAplikasi()));
            },
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 9.5),
            child: const Text(
              'Lainnya',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          ProfileContent(
            icon: Icons.lock,
            title: 'Kebijakan Privasi',
            onTapFunction: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => KebijakanPrivasi()));},
          ),
          if (isLoggedIn)
            ProfileContent(
              icon: Icons.exit_to_app_rounded,
              title: 'Keluar',
              onTapFunction: () {
                CustomPopup(
                    img: "assets/svg/illustrations3.svg",
                    title: "Anda yakin ingin keluar?",
                    buttonText1: "Keluar",
                    buttonText2: 'Batal',
                    buttonFunction1: (() {
                      logout();
                      Navigator.of(context, rootNavigator: true).pop();
                    }),
                    buttonFunction2: (() {
                      Navigator.of(context, rootNavigator: true).pop();
                    })).show(context);
              },
            ),
        ],
      ),
    );
  }

  Stack sudahLogin(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.14,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/gradient_icon.png"),
                  alignment: Alignment.centerRight),
              gradient: LinearGradient(
                stops: [0.1, 0.4],
                colors: [signalOrange, pomegranate],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(50))),
        ),
        ListTile(
          contentPadding: const EdgeInsets.only(bottom: 10, left: 20),
          title: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 7, right: MediaQuery.of(context).size.width * 0.05),
                child: Text(
                  loginResponse!.username,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: whiteColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EditProfil()),
                  );
                },
                icon: SvgPicture.asset("assets/svg/pencil.svg"),
              )
            ],
          ),
          subtitle: Text('+${loginResponse!.telp}',
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: whiteColor)),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: const Image(
                fit: BoxFit.cover, image: AssetImage("images/foto_null.png")),
          ),
        ),
      ],
    );
  }

  Row masukAndDaftar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          margin: const EdgeInsets.only(
              bottom: 10, left: 10.0, right: 10.0, top: 20),
          width: MediaQuery.of(context).size.width * 0.4,
          height: 45,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            style: ElevatedButton.styleFrom(
              primary: pomegranate,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Text(
              "Masuk",
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: whiteColor,
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
              bottom: 10, left: 10.0, right: 10.0, top: 20),
          width: MediaQuery.of(context).size.width * 0.4,
          height: 45,
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()));
            },
            style: OutlinedButton.styleFrom(
              primary: whiteColor,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: pomegranate,
                    width: 1,
                    style: BorderStyle
                        .solid), //ini kok gamau berubah ya warnanya:(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Text(
              "Daftar",
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: pomegranate,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTapFunction,
    this.icon2,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String? icon2;
  final Null Function() onTapFunction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        visualDensity: VisualDensity(vertical: -4),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        minLeadingWidth: 10,
        title: Text(title, style: const TextStyle(fontSize: 14)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon2 != null)
              SvgPicture.asset(
                icon2!,
                color: redColor,
              ),
            Icon(Icons.keyboard_arrow_right_rounded, color: blackColor),
          ],
        ),
        //onTap calls When ListTile Taps
        onTap: onTapFunction);
  }
}
