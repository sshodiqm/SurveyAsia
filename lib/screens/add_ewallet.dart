import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/response_model.dart';
import 'package:survei_asia/res/theme.dart';

class AddEWallet extends StatefulWidget{
  const AddEWallet({Key? key, this.loginResponse}) : super(key: key);
  final Data? loginResponse;

  @override
  State<AddEWallet> createState() => _AddEWallet();
}

class _AddEWallet extends State<AddEWallet> {
  Data get loginResponse => widget.loginResponse!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Tambah E-Wallet",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),


      body : Column(
        children : [
        Container(
         margin: const EdgeInsets.only(top: 16.0, left: 14.0, right: 14.0),
         child: const Text(
          'Tautkan atau aktifkan akun E-Wallet Anda dengan SurveyAsia untuk mempermudah penukaran poin',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        ),

          ListTile(
            contentPadding: const EdgeInsets.only(left: 20.0, right: 20.0),
            leading : Image.asset('images/ovo.png'),
            minLeadingWidth: 10,
            title: const Text('Ovo',
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
            leading : Image.asset('images/gopay.png'),
            minLeadingWidth: 10,
            title: const Text('Gopay',
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
            leading : Image.asset('images/dana.png', height: 26, width: 26,),
            minLeadingWidth: 10,
            title: const Text('Dana',
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
    ],


      ),
    );
  }
}