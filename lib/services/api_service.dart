import 'dart:convert';
import 'package:survei_asia/models/responseCRUD_model.dart';
import 'package:survei_asia/models/response_get_userinfo_model.dart';
import 'package:survei_asia/models/response_userinfo_model.dart';
import 'package:survei_asia/models/response_survey.dart';
import 'package:survei_asia/services/shared_service.dart';
import '../models/response_model.dart';
import '../models/response_news.dart';
import '../utils/config.dart';
import 'package:http/http.dart' as http;

class APIService {
  static var client = http.Client();

  static Future<bool> registerTelp(
      String username, String telp, String password) async {

    var status = await checkPhoneNumber(telp);
    if (status) {
      return false;
    }

    print("Start Register Proses");
    var url = Uri.parse(Config.accountAPI);

    var data = {
      'username': username,
      'telp': telp,
      'password': password,
    };
    print(data);
    var response = await client.post(url, body: data);

    print("Status Code : ${response.statusCode}");

    if (response.statusCode == 201) {
      var responseBody = response.body;
      ResponseCRUDModel responseCRUDModel = responseCRUDfromJson(responseBody);
      if (responseCRUDModel.data.telp == telp &&
          responseCRUDModel.data.password == password) {
        print("Register Success");

        //auto login
        var statusLogin = await loginTelp(telp, password);
        if (statusLogin) {
          return true;
        }
      } else {
        print("Register Failed");
      }
    } else {
      print(response.reasonPhrase);
    }
    return false;
  }

  static Future<bool> registerEmail(
      String username, String telp, String email, String password) async {

    var statusEmail = await checkEmail(email);
    var statusTelepon = await checkPhoneNumber(telp);

    if (statusTelepon || statusEmail) {
      return false;
    }

    print("Start Register Proses");
    var url = Uri.parse(Config.accountAPI);

    var data = {
      'username': username,
      'telp': telp,
      'password': password,
      'email' : email
    };
    print(data);
    var response = await client.post(url, body: data);

    print("Status Code : ${response.statusCode}");

    if (response.statusCode == 201) {
      var responseBody = response.body;
      ResponseCRUDModel responseCRUDModel = responseCRUDfromJson(responseBody);
      if (responseCRUDModel.data.telp == telp &&
          responseCRUDModel.data.password == password && responseCRUDModel.data.email == email) {
        print("Register Success");
        return true;
      } else {
        print("Register Failed");
      }
    } else {
      print(response.reasonPhrase);
    }
    return false;
  }

  static Future<bool> loginEmail(String email, String password) async {
    var url = Uri.parse("${Config.accountAPI}/?email=$email");

    var response = await client.get(url);

    print("Status Code : ${response.statusCode}");

    if (response.statusCode == 200) {
      var responseBody = response.body;
      ResponseModel responseModel = responseModelFromJson(responseBody);
      if (responseModel.data.isNotEmpty) {
        for (var element in responseModel.data) {
          if (element.email == email && element.password == password) {
            SharedService.setLoginDetails(responseModel);
            SharedService.setIsLoggedIn(true);
            print("Login Berhasil");
            return true;
          } else {
            print("Password Salah");
          }
        }
      } else {
        print("Login Failed, Email tidak ditemukan");
      }
    } else {
      print(response.reasonPhrase);
    }
    return false;
  }

  // static Future<bool> loginUsername(String username, String password) async {
  //   var url = Uri.parse("${Config.accountAPI}/?username=$username");

  //   var response = await client.get(url);

  //   print("Status Code : ${response.statusCode}");

  //   if (response.statusCode == 200) {
  //     var responseBody = response.body;
  //     ResponseModel responseModel = responseModelFromJson(responseBody);
  //     if (responseModel.data.isNotEmpty) {
  //       for (var element in responseModel.data) {
  //         if (element.username == username && element.password == password) {
  //           SharedService.setLoginDetails(responseModel);
  //           SharedService.setIsLoggedIn(true);
  //           print("Login Berhasil");
  //           return true;
  //         } else {
  //           print("Password Salah");
  //         }
  //       }
  //     } else {
  //       print("Login Failed, Username tidak ditemukan");
  //     }
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  //   return false;
  // }

  static Future<bool> loginTelp(String telp, String password) async {
    print("{ noTelp : $telp \n password : $password}");
    var url = Uri.parse("${Config.accountAPI}/?telp=$telp");

    var response = await client.get(url);

    print("Status Code : ${response.statusCode}");

    if (response.statusCode == 200) {
      var responseBody = response.body;
      ResponseModel responseModel = responseModelFromJson(responseBody);
      if (responseModel.data.isNotEmpty) {
        for (var element in responseModel.data) {
          if (element.telp == telp && element.password == password) {
            SharedService.setLoginDetails(responseModel);
            SharedService.setIsLoggedIn(true);
            print("Login Berhasil");
            return true;
          } else {
            print("Password Salah");
          }
        }
      } else {
        print("Login Failed, No Hp tidak ditemukan");
      }
    } else {
      print(response.reasonPhrase);
    }
    return false;
  }

  static Future<bool> checkPhoneNumber(String telp) async {
    var telpEncode = Uri.encodeComponent(telp);

    print("{ noTelp encoded : $telpEncode}");

    var url = Uri.parse("${Config.accountAPI}?telp=$telpEncode");

    var response = await client.get(url);

    print("Status Code : ${response.statusCode}");

    if (response.statusCode == 200) {
      var responseBody = response.body;
      ResponseModel responseModel = responseModelFromJson(responseBody);
      if (responseModel.data.isNotEmpty) {
        SharedService.setLoginDetails(responseModel);
        print("No Hp ada : ${responseModel.data[0].telp}");
        return true;
      } else {
        print("No Hp tidak ditemukan");
      }
    } else {
      print(response.reasonPhrase);
    }
    return false;
  }

  static Future<bool> changePassword(String telp, String password) async {
    //get data
    print("Change Password Process Start dengan no Hp : $telp");
    var url = Uri.parse("${Config.accountAPI}?telp=$telp");
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var responseBody = response.body;
      ResponseModel responseModel = responseModelFromJson(responseBody);
      if (responseModel.data.isNotEmpty) {
        //change password
        var id = responseModel.data[0].id;
        print(id);
        var status = await updatePassword(id, password);
        return status;
      } else {
        print("Data tidak ditemukan");
      }
    } else {
      print(response.reasonPhrase);
    }
    print(response.statusCode);
    return false;
  }

  static Future<bool> updatePassword(String id, String password) async {
    print("Update Password Process Start");
    var url = Uri.parse("${Config.accountAPI}/$id");
    var response = await client.put(url, body: {"password": password});

    if (response.statusCode == 200) {
      var responseBody = response.body;
      ResponseCRUDModel responseCRUDModel = responseCRUDfromJson(responseBody);
      if (responseCRUDModel.data.password == password) {
        var notifyData = await checkPhoneNumber(responseCRUDModel.data.telp);
        return notifyData;
      }
    } else {
      print(response.reasonPhrase);
    }
    return false;
  }

  static Future<bool> updateUsername(String id, String username) async {
    print("Update Username Process Start");
    var url = Uri.parse("${Config.accountAPI}/$id");

    var response = await client.put(url, body: {"username": username});

    if (response.statusCode == 200) {
      var responseBody = response.body;
      ResponseCRUDModel responseCRUDModel = responseCRUDfromJson(responseBody);
      if (responseCRUDModel.data.username == username) {
        var notifyData = await checkPhoneNumber(responseCRUDModel.data.telp);
        return notifyData;
      }
    } else {
      print(response.reasonPhrase);
    }
    return false;
  }

  static Future<bool> updateTelp(String id, String telp) async {
    print("Update No Telphone Process Start");
    var url = Uri.parse("${Config.accountAPI}/$id");

    var response = await client.put(url, body: {"telp": telp});

    if (response.statusCode == 200) {
      var responseBody = response.body;
      ResponseCRUDModel responseCRUDModel = responseCRUDfromJson(responseBody);
      if (responseCRUDModel.data.telp == telp) {
        var notifyData = await checkPhoneNumber(responseCRUDModel.data.telp);
        return notifyData;
      }
    } else {
      print(response.reasonPhrase);
    }
    return false;
  }

  static Future<bool> getUserInfo(String? id) async {
    //get data
    print("ID User : $id");
    var url = Uri.parse("${Config.accountAPI}/$id/userInfo/");
    var response = await client.get(url);

    if (response.statusCode == 200) {
      print(response.statusCode);
      var responseBody = response.body;
      ResponseGetUserinfoModel getUserinfoModel =
      responseGetUserInfofromJson(responseBody);
      if (getUserinfoModel.data.isNotEmpty) {
        print('User Info ditemukan');
        print(responseBody);
        print('ID USER INFO : ${getUserinfoModel.data[0].id}');
        print('ID USER : ${getUserinfoModel.data[0].accountId}');
        SharedService.setUserInfo(getUserinfoModel);
        return true;
      } else {
        print('User Info tidak ditemukan');
      }
    } else {
      print(response.reasonPhrase);
    }
    return false;
  }

  static Future<bool> addUserinfo(DataUser data) async {
    var id = data.id;
    print(id);
    var url = Uri.parse("${Config.accountAPI}/$id/userInfo");
    var body = {
      "nik": data.nik,
      "namaLengkap": data.namaLengkap,
      "email": data.email,
      "jenisKelamin": data.jenisKelamin,
      "tempatLahir": data.tempatLahir,
      "tanggalLahir": data.tanggalLahir,
      "pekerjaan": data.pekerjaan,
      "alamatKantor": data.alamatKantor,
      "provinsi": data.provinsi,
      "kota": data.kota,
      "kecamatan": data.kecamatan,
      "kodePos": data.kodePos,
      "alamat": data.alamatKantor,
    };

    var response = await client.post(url, body: body);

    if (response.statusCode == 201) {
      var responseBody = response.body;
      print(response.statusCode);
      print(responseBody);
      ResponseUserinfoModel responseUserinfoModel =
      responseUserInfofromJson(responseBody);
      if (responseUserinfoModel.data.accountId == data.id) {
        print("User info berhasil dibuat");
        print(responseBody);
        var getDataStatus = await getUserInfo(data.id);
        return (getDataStatus) ? true : false;
      }
    } else {
      print(response.reasonPhrase);
    }

    return false;
  }

  static Future<bool> updatePersonalInformation(DataUser data) async {
    var id = data.id;
    var accountId = data.accountId;
    var url = Uri.parse("${Config.accountAPI}/$accountId/userInfo/$id");
    var body = {
      "namaLengkap": data.namaLengkap,
      "email": data.email,
      "jenisKelamin": data.jenisKelamin,
      "tempatLahir": data.tempatLahir,
      "tanggalLahir": data.tanggalLahir,
      "pekerjaan": data.pekerjaan,
      "alamatKantor": data.alamatKantor,
    };

    var response = await client.put(url, body: body);

    if (response.statusCode == 200) {
      var responseBody = response.body;
      ResponseUserinfoModel responseUserinfoModel =
      responseUserInfofromJson(responseBody);
      if (responseUserinfoModel.data.id == data.id &&
          responseUserinfoModel.data.accountId == data.accountId) {
        print("User info berhasil diupdate");
        print(responseBody);
        print(id);
        print(accountId);
        var getDataStatus = await getUserInfo(data.accountId);
        return (getDataStatus) ? true : false;
      }
    } else {
      print(response.reasonPhrase);
    }
    return false;
  }

  static Future<bool> updateUserAddress(DataUser data) async {
    var id = data.id;
    var accountId = data.accountId;
    var url = Uri.parse("${Config.accountAPI}/$accountId/userInfo/$id");
    var body = {
      "provinsi": data.provinsi,
      "kota": data.kota,
      "kecamatan": data.kecamatan,
      "kodePos": data.kodePos,
      "alamat": data.alamatKantor,
    };

    var response = await client.put(url, body: body);

    if (response.statusCode == 200) {
      var responseBody = response.body;
      ResponseUserinfoModel responseUserinfoModel =
      responseUserInfofromJson(responseBody);
      if (responseUserinfoModel.data.id == data.id &&
          responseUserinfoModel.data.accountId == data.accountId) {
        print("User info berhasil diupdate");
        print(responseBody);
        print(id);
        print(accountId);
        var getDataStatus = await getUserInfo(data.accountId);
        return (getDataStatus) ? true : false;
      }
    } else {
      print(response.reasonPhrase);
    }
    return false;
  }

  // get all survey
  static Future<List<DataSurvey>?> getAllSurvey() async {
    var url = Uri.parse(Config.surveyAPI);
    var response = await client.get(url);
    List<DataSurvey>? dataSurvey;

    if (response.statusCode == 200) {
      var responseBody = response.body;
      print(responseBody);
      ResponseSurvey responseSurvey = responseSurveyfromJson(responseBody);
      if (responseSurvey.data.isNotEmpty) {
        dataSurvey = responseSurvey.data;
      }
    }
    return dataSurvey;
  }

  //get survey by id
  static Future<List<DataSurvey>?> getSurveyById(String id) async {
    var url = Uri.parse("${Config.surveyAPI}/$id");
    var response = await client.get(url);
    List<DataSurvey>? dataSurvey;

    if (response.statusCode == 200) {
      var responseBody = response.body;
      ResponseSurvey responseSurvey = responseSurveyfromJson(responseBody);
      if (responseSurvey.data.isNotEmpty) {
        dataSurvey = responseSurvey.data;
      }
    }
    return dataSurvey;
  }

  //get all news
  static Future<List<DataNews>?> getAllNews() async {
    var url = Uri.parse(Config.newsAPI);
    var response = await client.get(url);
    List<DataNews>? dataNews;

    if (response.statusCode == 200) {
      var responseBody = response.body;
      print(responseBody);
      ResponseNews responseNews = responseNewsfromJson(responseBody);
      if (responseNews.data.isNotEmpty) {
        dataNews = responseNews.data;
      }
    }
    return dataNews;
  }

  static Future<bool> checkEmail(String email) async {
    var url = Uri.parse("${Config.accountAPI}?email=$email");

    var response = await client.get(url);

    print("Status Code : ${response.statusCode}");

    if (response.statusCode == 200) {
      var responseBody = response.body;
      ResponseModel responseModel = responseModelFromJson(responseBody);
      if (responseModel.data.isNotEmpty) {
        SharedService.setLoginDetails(responseModel);
        print("No Hp ada : ${responseModel.data[0].telp}");
        return true;
      } else {
        print("No Hp tidak ditemukan");
      }
    } else {
      print(response.reasonPhrase);
    }
    return false;
  }
}
