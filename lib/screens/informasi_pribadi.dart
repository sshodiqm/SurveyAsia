import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:survei_asia/screens/data_pribadi.dart';
import 'package:survei_asia/screens/data_alamat.dart';
import '../models/response_model.dart';
import 'package:survei_asia/res/theme.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key, this.loginResponse}) : super(key: key);
  final Data? loginResponse;

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  Data get loginResponse => widget.loginResponse!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Informasi Pribadi",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          PersonalInfoContent(
            icon: Icons.perm_identity,
            title: 'Data Pribadi',
            onTapFunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DataPribadi(),
                ),
              );
            },
          ),
          PersonalInfoContent(
            icon: Icons.location_on_outlined,
            title: 'Data Alamat',
            onTapFunction: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DataAlamat(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PersonalInfoContent extends StatelessWidget {
  const PersonalInfoContent({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTapFunction,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Null Function() onTapFunction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        visualDensity: const VisualDensity(vertical: -4),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        minLeadingWidth: 10,
        title: Text(title, style: const TextStyle(fontSize: 14)),
        trailing:
            const Icon(Icons.keyboard_arrow_right_rounded, color: blackColor),
        //onTap calls When ListTile Taps
        onTap: onTapFunction);
  }
}
