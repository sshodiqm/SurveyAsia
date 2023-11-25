import 'dart:convert';

ResponseSurvey responseSurveyfromJson(String str) =>
    ResponseSurvey.fromJson(json.decode(str));

class ResponseSurvey {
  ResponseSurvey({
    required this.message,
    required this.count,
    required this.data,
  });
  late final String message;
  late final int count;
  late final List<DataSurvey> data;

  ResponseSurvey.fromJson(Map<String, dynamic> json){
    message = json['message'];
    count = json['count'];
    data = List.from(json['data']).map((e)=>DataSurvey.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['count'] = count;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class DataSurvey {
  DataSurvey({
    required this.namaSurvey,
    required this.author,
    required this.tipeSurvey,
    required this.kategori,
    required this.tanggalMulai,
    required this.tanggalSelesai,
    required this.poin,
    required this.deskripsi,
    required this.waktuPengerjaan,
    required this.jumlahPertanyaan,
    required this.id,
  });
  late final String namaSurvey;
  late final String author;
  late final String tipeSurvey;
  late final String kategori;
  late final String tanggalMulai;
  late final String tanggalSelesai;
  late final String poin;
  late final String deskripsi;
  late final String waktuPengerjaan;
  late final String jumlahPertanyaan;
  late final String id;

  DataSurvey.fromJson(Map<String, dynamic> json){
    namaSurvey = json['namaSurvey'];
    author = json['author'];
    tipeSurvey = json['tipeSurvey'];
    kategori = json['kategori'];
    tanggalMulai = json['tanggalMulai'];
    tanggalSelesai = json['tanggalSelesai'];
    poin = json['poin'];
    deskripsi = json['deskripsi'];
    waktuPengerjaan = json['waktuPengerjaan'];
    jumlahPertanyaan = json['jumlahPertanyaan'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['namaSurvey'] = namaSurvey;
    _data['author'] = author;
    _data['tipeSurvey'] = tipeSurvey;
    _data['kategori'] = kategori;
    _data['tanggalMulai'] = tanggalMulai;
    _data['tanggalSelesai'] = tanggalSelesai;
    _data['poin'] = poin;
    _data['deskripsi'] = deskripsi;
    _data['waktuPengerjaan'] = waktuPengerjaan;
    _data['jumlahPertanyaan'] = jumlahPertanyaan;
    _data['id'] = id;
    return _data;
  }
}