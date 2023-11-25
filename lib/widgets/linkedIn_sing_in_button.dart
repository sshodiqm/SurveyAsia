import 'package:flutter/material.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:survei_asia/screens/main_screens.dart';

class LinkedinSignInButton extends StatefulWidget {
  const LinkedinSignInButton({Key? key}) : super(key: key);

  @override
  State createState() => _LinkedinSignInButton();
}

class _LinkedinSignInButton extends State<LinkedinSignInButton> {
  late UserObject user;
  bool _isSigningIn = false;
  bool logoutUser = false;

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
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (final BuildContext context) => LinkedInUserWidget(
                      appBar: AppBar(
                        title: const Text(
                          'Masuk',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        centerTitle: true,
                        backgroundColor: Colors.white,
                      ),
                      destroySession: logoutUser,
                      redirectUrl: 'http://127.0.0.1:3000/redirect',
                      clientId: '77hdr3497x5pl7',
                      clientSecret: '8Dx9Zufgij57i5FH',
                      projection: const [
                        ProjectionParameters.id,
                        ProjectionParameters.localizedFirstName,
                        ProjectionParameters.localizedLastName,
                        ProjectionParameters.firstName,
                        ProjectionParameters.lastName,
                        ProjectionParameters.profilePicture,
                      ],
                      onError: (final UserFailedAction e) {
                        print('Error: ${e.toString()}');
                        print('Error: ${e.stackTrace.toString()}');
                      },
                      onGetUserProfile:
                          (final UserSucceededAction linkedInUser) {
                        print(
                          'Access token ${linkedInUser.user.token.accessToken}',
                        );

                        print('User id: ${linkedInUser.user.userId}');

                        user = UserObject(
                          firstName:
                              linkedInUser.user.firstName!.localized!.label!,
                          lastName:
                              linkedInUser.user.lastName!.localized!.label!,
                          email: linkedInUser.user.email!.elements![0]
                              .handleDeep!.emailAddress!,
                          profileImageUrl: linkedInUser
                              .user
                              .profilePicture!
                              .displayImageContent!
                              .elements![0]
                              .identifiers![0]
                              .identifier!,
                        );

                        setState(() {
                          logoutUser = false;
                        });

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => MainScreens(
                                      index: 0,
                                    )),
                            (route) => false);
                      },
                    ),
                    fullscreenDialog: true,
                  ),
                );
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Image(
                      image: AssetImage("images/linkedin.png"),
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class UserObject {
  UserObject({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profileImageUrl,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String profileImageUrl;
}
