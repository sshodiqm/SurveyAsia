import 'dart:convert';

ResponseCRUDModel responseCRUDfromJson(String str) =>
    ResponseCRUDModel.fromJson(json.decode(str));

class ResponseCRUDModel {
  ResponseCRUDModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data data;

  ResponseCRUDModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['data'] = data.toJson();
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