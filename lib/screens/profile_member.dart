import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:survei_asia/screens/main_screens.dart';
import 'package:survei_asia/screens/password_changed.dart';

import '../res/theme.dart';

class ProfileMember extends StatefulWidget {
  @override
  State<ProfileMember> createState() => _ProfileMemberState();
}

class _ProfileMemberState extends State<ProfileMember> {
  @override
  void initState() {
    super.initState();
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
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.height*1,
                  height: MediaQuery.of(context).size.height*0.1,
                  decoration: const BoxDecoration(
                      color: pomegranate,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))
                  ),
                ),
                const ListTile(
                  contentPadding:
                      EdgeInsets.only(left: 20.0, right: 20.0),
                  title: Text(
                    'Kianna123',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text("085123456789",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 10, color: whiteColor)),
                  leading: Icon(Icons.account_circle, color: whiteColor, size: 40),
                  minLeadingWidth: 10,
                  trailing: Icon(Icons.edit, color: whiteColor),
                )
              ],
            ),

            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: const Text(
                'Informasi',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),

            ListTile(
              contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
              leading: const Icon(Icons.card_giftcard, color: blackColor),
              minLeadingWidth: 10,
              title: const Text('Reward',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded,
                  color: blackColor),
              //onTap calls When ListTile Taps
              onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => RewardScreen(),
//                   ),
//                 );
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
              leading: const Icon(Icons.settings, color: blackColor),
              minLeadingWidth: 10,
              title: const Text('Pengaturan akun',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded,
                  color: blackColor),
              //onTap calls When ListTile Taps
              onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SettingScreen(),
//                   ),
//                 );
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
              leading: const Icon(Icons.perm_identity, color: blackColor),
              minLeadingWidth: 10,
              title: const Text('Informasi Pribadi',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded,
                  color: blackColor),
              //onTap calls When ListTile Taps
              onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => InfoPribadiScreen(),
//                   ),
//                 );
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
              leading: const Icon(Icons.history, color: blackColor),
              minLeadingWidth: 10,
              title: const Text('Riwayat',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded,
                  color: blackColor),
              //onTap calls When ListTile Taps
              onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => HistoryScreen(),
//                   ),
//                 );
              },
            ),

            //bagian pusat bantuan
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: const Text(
                'Pusat Bantuan',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
              leading: const Icon(Icons.chat_bubble_outline_rounded,
                  color: blackColor),
              minLeadingWidth: 10,
              title: const Text('Chat dengan Surveyasia',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded,
                  color: blackColor),
              //onTap calls When ListTile Taps
              onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ChatScreen(),
//                   ),
//                 );
              },
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
              leading:
                  const Icon(Icons.info_outline_rounded, color: blackColor),
              minLeadingWidth: 10,
              title: const Text('Tentang Aplikasi',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded,
                  color: blackColor),
              //onTap calls When ListTile Taps
              onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => InfoAplikasiScreen(),
//                   ),
//                 );
              },
            ),

            //bagian lainnya
            Container(
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: const Text(
                'Lainnya',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
              leading: const Icon(Icons.lock, color: blackColor),
              minLeadingWidth: 10,
              title: const Text('Kebijakan Privasi',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded,
                  color: blackColor),
              //onTap calls When ListTile Taps
              onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => PrivacyPolicyScreen(),
//                   ),
//                 );
              },
            ),

            ListTile(
              contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
              leading: const Icon(Icons.logout_outlined, color: blackColor),
              minLeadingWidth: 10,
              title: const Text('Logout',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
              trailing: const Icon(Icons.keyboard_arrow_right_rounded,
                  color: blackColor),
              //onTap calls When ListTile Taps
              onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => InfoAplikasiScreen(),
//                   ),
//                 );
              },
            ),
          ],
        ));
  }
}
