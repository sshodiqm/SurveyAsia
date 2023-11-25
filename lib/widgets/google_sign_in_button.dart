import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:survei_asia/screens/main_screens.dart';
import 'package:survei_asia/services/api_service.dart';
import 'package:survei_asia/utils/authentication.dart';

import '../services/shared_service.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            )
          : OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                });
                User? user =
                    await Authentication.signInWithGoogle(context: context);

                setState(() {
                  _isSigningIn = false;
                });
                /*
                if (user != null) {
                  // Email in database
                  print('Google Sign In Button was called');

                  if (await APIService.checkEmail(user.email!)) {
                    await APIService.loginEmail(user.email!, '').then(
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
                  } else {
                    // Email not in database
                    if (user.phoneNumber != null) {
                      // User's phone number from Google is available
                      print('User\'s phone number from Google is available');
                      await APIService.registerEmail(user.displayName!,
                              user.phoneNumber!, user.email!, '')
                          .then((value) {
                        if (value) {
                          registerSuccess();
                        }
                      });
                    } else {
                      // User's phone number from Google is not available
                      print('User\'s phone number from Google is not available');
                      await APIService.registerEmail(
                              user.displayName!, '', user.email!, '')
                          .then((value) {
                        if (value) {
                          registerSuccess();
                        }
                      });
                    }
                  }

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainScreens(
                                index: 0,
                              )),
                      (route) => false);
                }

                 */
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Image(
                      image: AssetImage("images/google.png"),
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ),
            ),
    );
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

  void registerSuccess() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Register Berhasil")));
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainScreens(index: 0)),
        (route) => false);
  }
}
