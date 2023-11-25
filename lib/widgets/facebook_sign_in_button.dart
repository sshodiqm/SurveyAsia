import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:survei_asia/screens/main_screens.dart';

import '../services/api_service.dart';
import '../services/shared_service.dart';

class FacebookSignInButton extends StatefulWidget {
  const FacebookSignInButton({Key? key}) : super(key: key);

  @override
  State createState() => _FacebookSignInButton();
}

class _FacebookSignInButton extends State<FacebookSignInButton> {
  String userEmail = "";
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: _isSigningIn
            ? const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        )
            : OutlinedButton(
          onPressed: () async {
            setState(() {
              _isSigningIn = true;
            });

            await signInWithFacebook();


            setState(() {
              _isSigningIn = false;
            });
            /*
                  if (userEmail != null) {
                    await APIService.loginEmail(userEmail!, '').then(
                          (response) => {
                        if (response)
                          {
                            //valid credential
                            loginSuccess(),
                          }
                        else
                          {
                            //invalid credential
                            // loginFailed(showContext!)
                            print('Invalid credential')
                          }
                      },
                    );
                    Navigator.pushAndRemoveUntil(
                      context,
                        MaterialPageRoute(builder: (context) => MainScreens(
                          index: 0,

                        )),
                        (route) => false
                    );
                  }


                   */
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)))),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 24,
                  )
                ],
              )),
        ));
  }

  Future<UserCredential> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance
        .login(permissions: ['email', 'public_profile']);

    final OAuthCredential credential =
    FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final userData = await FacebookAuth.instance.getUserData();

    userEmail = userData['email'];

    return FirebaseAuth.instance.signInWithCredential(credential);
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
}
