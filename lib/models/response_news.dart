import 'dart:convert';

ResponseNews responseNewsfromJson(String str) =>
    ResponseNews.fromJson(json.decode(str));

class ResponseNews {
  ResponseNews({
    required this.message,
    required this.count,
    required this.data,
  });
  late final String message;
  late final int count;
  late final List<DataNews> data;

  ResponseNews.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    count = json['count'];
    data = List.from(json['data']).map((e) => DataNews.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['count'] = count;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class DataNews {
  DataNews({
    required this.header,
    required this.link,
    required this.id,
  });
  late final String header;
  late final String link;
  late final String id;

  DataNews.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    link = json['link'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['header'] = header;
    _data['link'] = link;
    _data['id'] = id;
    return _data;
  }
}
