import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:survei_asia/models/response_get_userinfo_model.dart';
import 'package:survei_asia/screens/informasi_pribadi.dart';
import 'package:survei_asia/screens/main_screens.dart';
import '../models/province.dart';
import '../models/city.dart';
import '../models/districs.dart';
import '../models/response_model.dart';
import '../models/response_userinfo_model.dart';
import '../models/sub_districs.dart';
import '../res/theme.dart';
import '../services/api_service.dart';
import '../services/shared_service.dart';
import '../utils/config.dart';
import '../widgets/loading_page.dart';

class DataAlamat extends StatefulWidget {
  const DataAlamat(
      {super.key,
      this.nik,
      this.name,
      this.email,
      this.gender,
      this.birthPlace,
      this.birthDate,
      this.job,
      this.jobAddress});

  final String? nik,
      name,
      email,
      gender,
      birthPlace,
      birthDate,
      job,
      jobAddress;

  @override
  State<DataAlamat> createState() => _DataAlamatState();
}

class _DataAlamatState extends State<DataAlamat> {
  Data? loginResponse;
  DataUserInfo? userInfoData;

  Province? userProvData;
  City? userCityData;
  Districs? userDistricsData;

  String? idProv, idCity, idDist;

  String provName = 'Pilih Provinsi';
  String cityName = 'Pilih Kota';
  String districsName = 'Pilih Kecamatan';

  TextEditingController userAddressController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();

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
    var userProvince = await SharedService.userProvince();
    var userCity = await SharedService.userCity();
    var userDistrics = await SharedService.userDistrics();
    setState(() {
      if (userInfo != null) {
        userInfoData = userInfo.data[0];
        print(userInfoData);
        userAddressController.text = userInfoData!.alamat;
        postalCodeController.text = userInfoData!.kodePos;
        provName = userInfoData!.provinsi;
        cityName = userInfoData!.kota;
        districsName = userInfoData!.kecamatan;
      }
      if (userProvince != null) {
        userProvData = userProvince;
        idProv = userProvince.id;
      }
      if (userCity != null) {
        userCityData = userCity;
        idCity = userCity.id;
      }
      if (userDistrics != null) {
        userDistricsData = userDistrics;
        idDist = userDistrics.id;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            (userInfoData) != null ? 'Ubah Data Alamat' : 'Informasi Pribadi',
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          leading: const BackButton(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 2,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                top: (userInfoData) != null ? 0 : 20,
                bottom: 17,
                right: 20,
                left: 20),
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

                // 2. Data Alamat
                if (userInfoData == null)
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(top: 20.0),
                    child: const Text(
                      '2. Data Alamat',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),

                formTitle('Provinsi'),

                DropdownSearch<Province>(
                  mode: Mode.DIALOG,
                  showSearchBox: true,
                  onChanged: (value) {
                    setState(() {
                      idProv = value?.id;
                      userProvData = Province(id: value!.id, name: value.name);
                    });
                  },
                  dropdownBuilder: (context, selectedItem) =>
                      Text(selectedItem?.name ?? provName),
                  popupItemBuilder: (context, item, isSelected) => ListTile(
                    title: Text(item.name),
                  ),
                  onFind: (text) async {
                    var response = await http.get(Uri.parse(
                        "https://api.binderbyte.com/wilayah/provinsi?api_key=${Config.apiKey}"));
                    if (response.statusCode != 200) {
                      return [];
                    }
                    List allProvince = (json.decode(response.body)
                        as Map<String, dynamic>)["value"];
                    List<Province> allModelProvince = [];

                    allProvince.forEach((element) {
                      allModelProvince.add(
                          Province(id: element["id"], name: element["name"]));
                    });
                    return allModelProvince;
                  },
                ),

                formTitle('Kota'),

                DropdownSearch<City>(
                  mode: Mode.DIALOG,
                  showSearchBox: true,
                  onChanged: (value) {
                    idCity = value?.id;
                    userCityData = City(
                        id: value!.id,
                        idProvinsi: value.idProvinsi,
                        name: value.name);
                  },
                  dropdownBuilder: (context, selectedItem) =>
                      Text(selectedItem?.name ?? cityName),
                  popupItemBuilder: (context, item, isSelected) => ListTile(
                    title: Text(item.name),
                  ),
                  onFind: (text) async {
                    print(idProv);
                    print(userProvData?.name);
                    var response = await http.get(Uri.parse(
                        "https://api.binderbyte.com/wilayah/kabupaten?api_key=${Config.apiKey}&id_provinsi=$idProv"));
                    if (response.statusCode != 200) {
                      return [];
                    }
                    List allCity = (json.decode(response.body)
                        as Map<String, dynamic>)["value"];
                    List<City> allModelCity = [];

                    allCity.forEach((element) {
                      allModelCity.add(City(
                          id: element["id"],
                          idProvinsi: element["id_provinsi"],
                          name: element["name"]));
                    });
                    return allModelCity;
                  },
                ),

                formTitle('Kecamatan'),

                DropdownSearch<Districs>(
                  mode: Mode.DIALOG,
                  showSearchBox: true,
                  onChanged: (value) {
                    idDist = value?.id;
                    userDistricsData = Districs(
                        id: value!.id,
                        idKabupaten: value.idKabupaten,
                        name: value.name);
                  },
                  dropdownBuilder: (context, selectedItem) =>
                      Text(selectedItem?.name ?? districsName),
                  popupItemBuilder: (context, item, isSelected) => ListTile(
                    title: Text(item.name),
                  ),
                  onFind: (text) async {
                    print(idCity);
                    var response = await http.get(Uri.parse(
                        "https://api.binderbyte.com/wilayah/kecamatan?api_key=${Config.apiKey}&id_kabupaten=$idCity"));
                    if (response.statusCode != 200) {
                      return [];
                    }
                    List allDistrics = (json.decode(response.body)
                        as Map<String, dynamic>)["value"];
                    List<Districs> allModelDistrics = [];

                    allDistrics.forEach((element) {
                      allModelDistrics.add(Districs(
                          id: element["id"],
                          idKabupaten: element["id_kabupaten"],
                          name: element["name"]));
                    });
                    return allModelDistrics;
                  },
                ),

                formTitle('Kode Pos'),

                //Kode Pos Field
                TextFormField(
                  controller: postalCodeController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                    LengthLimitingTextInputFormatter(5)
                  ],
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukkan Kode Pos',
                      isDense: true,
                      contentPadding: EdgeInsets.all(15)),
                  keyboardType: TextInputType.number,
                ),

                formTitle('Alamat'),

                TextFormField(
                  controller: userAddressController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLines: 5,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Masukan Alamat',
                      isDense: true,
                      contentPadding: EdgeInsets.all(15)),
                  keyboardType: TextInputType.name,
                ),

                if (userInfoData != null)
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 55),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: pomegranate,
                      ),
                      onPressed: () {
                        updateInformation();
                      },
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
                        'Langkah 1/2',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      width: MediaQuery.of(context).size.width,
                      "assets/svg/garis1.svg",
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
                            handleSave();
                          },
                          child: const Text(
                            'Simpan',
                            style: TextStyle(fontSize: 16),
                          )),
                    )
                  ],
                ),
              )
            : null
        //     DropdownSearch<SubDistrics>(
        //       mode: Mode.DIALOG,
        //       showSearchBox: true,
        //       onChanged: (value) => print(value?.toJson()),
        //       dropdownBuilder: (context, selectedItem) =>
        //           Text(selectedItem?.name ?? "KELURAHAN"),
        //       popupItemBuilder: (context, item, isSelected) => ListTile(
        //         title: Text(item.name),
        //       ),
        //       onFind: (text) async {
        //         print(idDist);
        //         var response = await http.get(Uri.parse(
        //             "https://api.binderbyte.com/wilayah/kelurahan?api_key=${Config.apiKey}&id_kecamatan=$idDist"));
        //         if (response.statusCode != 200) {
        //           return [];
        //         }
        //         List allSubDistrics =
        //             (json.decode(response.body) as Map<String, dynamic>)["value"];
        //         List<SubDistrics> allModelSubDistrics = [];

        //         allSubDistrics.forEach((element) {
        //           allModelSubDistrics.add(SubDistrics(
        //               id: element["id"],
        //               idKecamatan: element["id_kecamatan"],
        //               name: element["name"]));
        //         });
        //         return allModelSubDistrics;
        //       },
        //     ),
        //     Container(
        //       width: 320,
        //       height: 48,
        //       child: ElevatedButton(
        //         onPressed: () {
        //           // Navigator.push(context,
        //           //     MaterialPageRoute(builder: (context) => const LoginScreen()));
        //         },
        //         style: ElevatedButton.styleFrom(
        //           primary: pomegranate,
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(6),
        //           ),
        //         ),
        //         child: Text(
        //           "Simpan",
        //           style: blackTextStyle.copyWith(
        //             fontSize: 16,
        //             fontWeight: FontWeight.w600,
        //             color: whiteColor,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
        );
  }

  handleSave() {
    var provinsi = userProvData?.name;
    var kota = userCityData?.name;
    var kecamatan = userDistricsData?.name;
    var kodePos = postalCodeController.text;
    var alamat = userAddressController.text;
    print(loginResponse!.id);
    print(provinsi);
    print(userProvData?.name);
    print(kota);
    print(kecamatan);
    print(kodePos);
    print(alamat);

    DataUser dataUser = DataUser(
      nik: widget.nik!,
      namaLengkap: widget.name!,
      email: widget.email!,
      jenisKelamin: widget.gender!,
      tempatLahir: widget.birthPlace!,
      tanggalLahir: widget.birthDate!,
      pekerjaan: widget.job!,
      alamatKantor: widget.jobAddress!,
      provinsi: provinsi!,
      kota: kota!,
      kecamatan: kecamatan!,
      kodePos: kodePos,
      alamat: alamat,
      id: loginResponse!.id,
    );

    if (userProvData != null) SharedService.setProvince(userProvData!);
    if (userCityData != null) SharedService.setCity(userCityData!);
    if (userDistricsData != null) SharedService.setDistrics(userDistricsData!);

    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.white.withOpacity(0.2),
      context: context,
      builder: (BuildContext context) {
        return const LoadingPage();
      },
    );

    APIService.addUserinfo(dataUser)
        .then((value) => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => MainScreens(
                      index: 2,
                    )),
            (route) => false));
  }

  Future<void> updateInformation() async {
    var provinsi = userProvData?.name ?? provName;
    var kota = userCityData?.name ?? cityName;
    var kecamatan = userDistricsData?.name ?? districsName;
    var kodePos = postalCodeController.text;
    var alamat = userAddressController.text;
    print(provinsi);
    print(userProvData?.name);
    print(kota);
    print(kecamatan);
    print(kodePos);
    print(alamat);

    DataUser dataUser = DataUser(
      nik: userInfoData!.nik,
      namaLengkap: userInfoData!.namaLengkap,
      email: userInfoData!.email,
      jenisKelamin: userInfoData!.jenisKelamin,
      tempatLahir: userInfoData!.tempatLahir,
      tanggalLahir: userInfoData!.tanggalLahir,
      pekerjaan: userInfoData!.pekerjaan,
      alamatKantor: userInfoData!.alamatKantor,
      provinsi: provinsi,
      kota: kota,
      kecamatan: kecamatan,
      kodePos: kodePos,
      alamat: alamat,
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

    APIService.updateUserAddress(dataUser)
        .then((value) => Navigator.pop(context)
            // (context,
            //     MaterialPageRoute(builder: (context) {
            //   return PersonalInfoScreen(); //-> simpan password baru
            // }))
            );
  }

  Container formTitle(String title) {
    return Container(
      alignment: Alignment.centerLeft,
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
}
