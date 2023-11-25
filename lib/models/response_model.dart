import 'dart:convert';

ResponseModel responseModelFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

class ResponseModel {
  ResponseModel({
    required this.message,
    required this.count,
    required this.data,
  });
  late final String message;
  late final int count;
  late final List<Data> data;

  ResponseModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    count = json['count'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['count'] = count;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.telp,
    required this.password,
    required this.username,
    required this.email,
    required this.id,
  });
  late final String telp;
  late final String password;
  late final String username;
  late final String email;
  late final String id;

  Data.fromJson(Map<String, dynamic> json){
    telp = json['telp'];
    password = json['password'];
    username = json['username'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['telp'] = telp;
    _data['password'] = password;
    _data['username'] = username;
    _data['email'] = email;
    _data['id'] = id;
    return _data;
  }
}
