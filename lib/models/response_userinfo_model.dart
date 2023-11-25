import 'dart:convert';

ResponseUserinfoModel responseUserInfofromJson(String str) =>
    ResponseUserinfoModel.fromJson(json.decode(str));

class ResponseUserinfoModel {
  ResponseUserinfoModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final DataUser data;

  ResponseUserinfoModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = DataUser.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class DataUser {
  DataUser({
    required this.nik,
    required this.namaLengkap,
    required this.email,
    required this.jenisKelamin,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.pekerjaan,
    required this.alamatKantor,
    required this.provinsi,
    required this.kota,
    required this.kecamatan,
    required this.kodePos,
    required this.alamat,
    required this.id,
    this.accountId,
  });
  late final String nik;
  late final String namaLengkap;
  late final String email;
  late final String jenisKelamin;
  late final String tempatLahir;
  late final String tanggalLahir;
  late final String pekerjaan;
  late final String alamatKantor;
  late final String provinsi;
  late final String kota;
  late final String kecamatan;
  late final String kodePos;
  late final String alamat;
  late final String id;
  late final String? accountId;

  DataUser.fromJson(Map<String, dynamic> json) {
    nik = json['nik'];
    namaLengkap = json['namaLengkap'];
    email = json['email'];
    jenisKelamin = json['jenisKelamin'];
    tempatLahir = json['tempatLahir'];
    tanggalLahir = json['tanggalLahir'];
    pekerjaan = json['pekerjaan'];
    alamatKantor = json['alamatKantor'];
    provinsi = json['provinsi'];
    kota = json['kota'];
    kecamatan = json['kecamatan'];
    kodePos = json['kodePos'];
    alamat = json['alamat'];
    id = json['id'];
    accountId = json['accountId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['nik'] = nik;
    _data['namaLengkap'] = namaLengkap;
    _data['email'] = email;
    _data['jenisKelamin'] = jenisKelamin;
    _data['tempatLahir'] = tempatLahir;
    _data['tanggalLahir'] = tanggalLahir;
    _data['pekerjaan'] = pekerjaan;
    _data['alamatKantor'] = alamatKantor;
    _data['provinsi'] = provinsi;
    _data['kota'] = kota;
    _data['kecamatan'] = kecamatan;
    _data['kodePos'] = kodePos;
    _data['alamat'] = alamat;
    _data['id'] = id;
    _data['accountId'] = accountId;
    return _data;
  }
}
