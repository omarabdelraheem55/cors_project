import 'dart:convert';
import 'dart:developer';
import 'package:cors_project/app/app_consts.dart';
import 'package:cors_project/domin/models/popular_image_model.dart';
import 'package:cors_project/domin/models/popular_info_model.dart';
import 'package:cors_project/domin/models/popular_model.dart';
import 'package:http/http.dart' as http;
import '../../domin/models/test_model.dart';
import '../../shared_pref/shared_pref.dart';

class PopularRequest {
  static void getPopular({
    required Function(List<Results>?) onSuccess,
    required Function(int statusCode) onError,
  }) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    await http
        .get(Uri.parse(AppConsts.baseUrl), headers: headers)
        .then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> decoded = {};
        decoded = json.decode(response.body);
        PopularModel popularModel = PopularModel.fromJson(decoded);
        onSuccess(popularModel.results);
      } else {
        onError(response.statusCode);
      }
      log(response.body, name: "this is my Respons:");
      log(response.statusCode.toString(), name: "this is my StatusCode:");
    });
  }

  static void getPopularInfo({
    required int id,
    required Function(PopularInfoModel) onSuccess,
    required Function(int statusCode) onError,
  }) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    await http
        .get(
            Uri.parse(
                "https://api.themoviedb.org/3/person/$id?api_key=2dfe23358236069710a379edd4c65a6b"),
            headers: headers)
        .then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> decoded = {};
        decoded = json.decode(response.body);
        PopularInfoModel popularInfoModel = PopularInfoModel.fromJson(decoded);
        onSuccess(popularInfoModel);
      } else {
        onError(response.statusCode);
      }
      log(response.body, name: "this is my Respons:");
      log(response.statusCode.toString(), name: "this is my StatusCode:");
    });
  }
  static void getPopularImage({
    required int id,
    required Function(PopularImageModel) onSuccess,
    required Function(int statusCode) onError,
  }) async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    await http
        .get(
            Uri.parse(
                "https://api.themoviedb.org/3/person/$id/images?api_key=2dfe23358236069710a379edd4c65a6b"),
            headers: headers)
        .then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> decoded = {};
        decoded = json.decode(response.body);
        PopularImageModel popularImageModel = PopularImageModel.fromJson(decoded);
        onSuccess(popularImageModel);
      } else {
        onError(response.statusCode);
      }
      log(response.body, name: "this is my Respons:");
      log(response.statusCode.toString(), name: "this is my StatusCode:");
    });
  }
  static void signUp() async {
    Map<String, String> headers = {"Content-Type": "application/json"};
    await http
        .post(Uri.parse("https://api.gohalal.ie/api/v1/register"),
            body: {
              "full_name": "omar",
              "email": "omar@gmail.com",
              "phone": "0102255555",
              "password": "11111111",
              "confirmed_password": "11111111",
              "privacy_policy": "1"
            },
            headers: headers)
        .then((response) {
      if (response.statusCode == 200) {
        Map<String, dynamic> decoded = {};
        decoded = json.decode(response.body);
        TestModel testModel = TestModel.fromJson(decoded);
        SharedPref.setToken(token: testModel.data!.token);
        log(testModel.data!.token.toString(), name: "test model");
      } else {}
      log(response.body, name: "this is my Respons:");
      log(response.statusCode.toString(), name: "this is my StatusCode:");
    });
  }
  }
