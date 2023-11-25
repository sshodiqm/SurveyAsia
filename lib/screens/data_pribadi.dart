import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:survei_asia/models/response_get_userinfo_model.dart';
import 'package:survei_asia/models/response_userinfo_model.dart';
import 'package:survei_asia/res/theme.dart';
import 'package:survei_asia/screens/data_alamat.dart';
import 'package:survei_asia/screens/edit_profil.dart';
import 'package:survei_asia/screens/informasi_pribadi.dart';
import 'package:survei_asia/screens/login.dart';

import '../models/response_model.dart';
import '../services/api_service.dart';
import '../services/shared_service.dart';
import '../widgets/custom_popup_button.dart';
import '../widgets/line_indicator.dart';
import '../widgets/loading_page.dart';

class DataPribadi extends StatefulWidget {
  const DataPribadi({
    Key? key,
  }) : super(key: key);

  @override
  State<DataPribadi> createState() => _DataPribadi();
}

class _DataPribadi extends State<DataPribadi> {
  Data? loginResponse;
  DataUserInfo? userInfoData;

  bool isButtonActive = false;

  DateTime? selectedDate;
  String? selectedGender;
  String? noHpUser;

  int pageIndex = 0;

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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nikController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController birthPlacecontroller = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController jobAddressController = TextEditingController();

  Future<void> checkLogin() async {
    var loginData = await SharedService.loginDetails();
    setState(() {
      if (loginData != null) {
        loginResponse = loginData.data[0];
        checkUserInfo();
      }
    });
  }

  Future<void> checkUserInfo() async {
    var userInfo = await SharedService.userInfo();
    setState(() {
      if (userInfo != null) {
        userInfoData = userInfo.data[0];
        print(userInfoData);
        nikController.text = userInfoData!.nik;
        nameController.text = userInfoData!.namaLengkap;
        emailController.text = userInfoData!.email;
        selectedGender = userInfoData!.jenisKelamin;
        birthPlacecontroller.text = userInfoData!.tempatLahir;
        birthDateController.text = userInfoData!.tanggalLahir;
        jobController.text = userInfoData!.pekerjaan;
        jobAddressController.text = userInfoData!.alamatKantor;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  void dispose() {
    nikController.dispose();
    nameController.dispose();
    emailController.dispose();
    birthPlacecontroller.dispose();
    birthDateController.dispose();
    jobController.dispose();
    jobAddressController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            (userInfoData) != null ? 'Ubah Data Pribadi' : 'Informasi Pribadi',
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: const BackButton(
            color: Colors.black,
          ),
          elevation: 2,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                top: (userInfoData) != null ? 0 : 20, bottom: 17),
            child: Column(
              children: [
                // Header Image
                if (userInfoData == null)
                  SvgPicture.asset(
                    "assets/svg/illustrations12.svg",
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),

                // Header Text
                if (userInfoData == null)
                  Container(
                    margin: const EdgeInsets.only(top: 20.0, bottom: 6),
                    child: const Text(
                      'Informasi Pribadi',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),

                // Header Subtitle
                if (userInfoData == null)
                  const Text(
                    'Silahkan lengkapi informasi pribadi anda',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black38),
                  ),

                // 1. Data Pribadi
                if (userInfoData == null)
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 20.0, left: 20),
                    child: const Text(
                      '1. Data Pribadi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),

                // Form
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    onChanged: () {
                      setState(() {
                        isButtonActive = _formKey.currentState!.validate();
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        formTitle('NIK (Nomor Induk Kependudukan)'),

                        //NIK Field
                        TextFormField(
                          controller: nikController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "NIK tidak";
                            } else if (value.length < 16) {
                              return "NIK tidak valid";
                            } else {
                              return null;
                            }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                            LengthLimitingTextInputFormatter(16)
                          ],
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Masukan NIK Anda',
                              isDense: true,
                              contentPadding: EdgeInsets.all(15)),
                          keyboardType: TextInputType.number,
                        ),

                        formTitle('Nama Lengkap'),

                        //Nama Lengkap Field
                        TextFormField(
                          controller: nameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Masukan Nama Lengkap Anda',
                              isDense: true,
                              contentPadding: EdgeInsets.all(15)),
                          keyboardType: TextInputType.name,
                        ),

                        formTitle('Email'),

                        //Email Field
                        TextFormField(
                          controller: emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: _onChanged,
                          validator: (value) {
                            RegExp regexx = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                            if (value!.isEmpty) {
                              return "Email Tidak Boleh Kosong";
                            } else if (!regexx.hasMatch(value)) {
                              return "Email tidak valid";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Masukan Email Anda',
                              isDense: true,
                              contentPadding: EdgeInsets.all(15)),
                          keyboardType: TextInputType.emailAddress,
                        ),

                        //Contoh
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

                        // Container(
                        //   margin: const EdgeInsets.only(top: 2),
                        //   child: const Text(
                        //     'Contoh : citiasia@gmail.com',
                        //     style: TextStyle(
                        //       color: Colors.grey,
                        //     ),
                        //   ),
                        // ),

                        formTitle('Jenis Kelamin'),

                        //Gender Radio Button
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                  contentPadding: EdgeInsets.all(0.0),
                                  value: 'laki-laki',
                                  groupValue: selectedGender,
                                  dense: true,
                                  title: const Text(
                                    'Laki-Laki',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      (val != null)
                                          ? selectedGender = val
                                          : val = null;
                                      print(selectedGender);
                                    });
                                  }),
                            ),
                            Expanded(
                              child: RadioListTile<String>(
                                  contentPadding: EdgeInsets.all(0.0),
                                  value: 'perempuan',
                                  groupValue: selectedGender,
                                  dense: true,
                                  title: const Text(
                                    'Perempuan',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      (val != null)
                                          ? selectedGender = val
                                          : val = null;
                                      print(selectedGender);
                                    });
                                  }),
                            ),
                          ],
                        ),

                        formTitle('Tempat Lahir'),

                        //Tempat Lahir Field
                        TextFormField(
                          controller: birthPlacecontroller,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Masukan Tempat Lahir',
                              isDense: true,
                              contentPadding: EdgeInsets.all(15)),
                          keyboardType: TextInputType.name,
                        ),

                        formTitle('Tanggal Lahir'),

                        //Tanggal Lahir Field
                        TextField(
                          controller: birthDateController,
                          decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.calendar_today_rounded),
                              border: OutlineInputBorder(),
                              hintText: 'Masukan Tanggal Lahir',
                              contentPadding: EdgeInsets.all(15)),
                          onTap: () async {
                            DateTime? pickeddate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101));

                            if (pickeddate != null) {
                              setState(() {
                                birthDateController.text =
                                    DateFormat('dd/MM/yyyy').format(pickeddate);
                              });
                            }
                          },
                        ),

                        formTitle('Pekerjaan'),

                        //Pekerjaan Field
                        TextFormField(
                          controller: jobController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Masukan Pekerjaan Anda',
                              isDense: true,
                              contentPadding: EdgeInsets.all(15)),
                          keyboardType: TextInputType.name,
                        ),

                        formTitle('Alamat Kantor'),

                        //Alamat Pekerjaan Field
                        TextFormField(
                          controller: jobAddressController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          maxLines: 5,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Masukan Alamat Kantor',
                              isDense: true,
                              contentPadding: EdgeInsets.all(15)),
                          keyboardType: TextInputType.name,
                        ),
                      ],
                    ),
                  ),
                ),

                if (userInfoData != null)
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 30, 20, 55),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: pomegranate,
                      ),
                      onPressed: isButtonActive
                          ? () {
                              updateInformation();
                            }
                          : null,
                      child: const Text(
                        'Simpan',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),

        // bottom navigasi cara ketiga (3)
        bottomNavigationBar: (userInfoData) == null
            ? Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                padding: EdgeInsets.fromLTRB(20, 12, 20, 20),
                // margin: EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 0),
                      child: const Text(
                        'Langkah 0/2',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      width: MediaQuery.of(context).size.width,
                      "assets/svg/garis0.svg",
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: pomegranate,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6))),
                          onPressed: () {
                            handleNext();
                          },
                          child: const Text(
                            'Selanjutnya',
                            style: TextStyle(fontSize: 16),
                          )),
                    )
                  ],
                ),
              )
            : null);
  }

  handleNext() {
    var nik = nikController.text;
    var nama = nameController.text;
    var email = emailController.text;
    var jenisKelamin = selectedGender;
    var tempatLahir = birthPlacecontroller.text;
    var tanggalLahir = birthDateController.text;
    var pekerjaan = jobController.text;
    var alamatKantor = jobAddressController.text;
    print(jenisKelamin);
    print(tanggalLahir);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DataAlamat(
                  nik: nik,
                  name: nama,
                  email: email,
                  gender: jenisKelamin,
                  birthPlace: tempatLahir,
                  birthDate: tanggalLahir,
                  job: pekerjaan,
                  jobAddress: alamatKantor,
                )));
  }

  Future<void> updateInformation() async {
    var nama = nameController.text;
    var email = emailController.text;
    var jenisKelamin = selectedGender;
    var tempatLahir = birthPlacecontroller.text;
    var tanggalLahir = birthDateController.text;
    var pekerjaan = jobController.text;
    var alamatKantor = jobAddressController.text;
    print(noHpUser);
    print(jenisKelamin);
    print(tanggalLahir);

    DataUser dataUser = DataUser(
      nik: userInfoData!.nik,
      namaLengkap: nama,
      email: email,
      jenisKelamin: jenisKelamin!,
      tempatLahir: tempatLahir,
      tanggalLahir: tanggalLahir,
      pekerjaan: pekerjaan,
      alamatKantor: alamatKantor,
      provinsi: userInfoData!.provinsi,
      kota: userInfoData!.kota,
      kecamatan: userInfoData!.kecamatan,
      kodePos: userInfoData!.kodePos,
      alamat: userInfoData!.alamat,
      id: userInfoData!.id,
      accountId: userInfoData!.accountId,
    );

    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.white.withOpacity(0.2),
      context: context,
      builder: (BuildContext context) {
        return const LoadingPage();
      },
    );

    APIService.updatePersonalInformation(dataUser)
        .then((value) => Navigator.pop(context)
            // (context,
            //     MaterialPageRoute(builder: (context) {
            //   return PersonalInfoScreen(); //-> simpan password baru
            // }))
            );
  }

  Container formTitle(String title) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }

  // Color getColor(Set<MaterialState> states) {
  //   const Set<MaterialState> interactiveStates = <MaterialState>{
  //     MaterialState.pressed,
  //     MaterialState.hovered,
  //     MaterialState.focused,
  //   };
  //   if (states.any(interactiveStates.contains)) {
  //     return Colors.blue;
  //   }
  //   return Colors.deepOrange;
  // }
}
