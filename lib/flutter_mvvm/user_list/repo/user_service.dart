import 'dart:io';

import 'package:flutter_one/flutter_mvvm/mvvm_utils/mvvm_utils.dart';
import 'package:flutter_one/flutter_mvvm/user_list/models/user_list_model.dart';
import 'package:flutter_one/flutter_mvvm/user_list/repo/api_status.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static Future<Object> getUser() async {
    try {
      var url = Uri.parse(usersList);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return Success(resposne: userListModelFromJson(response.body));
      }
      return Failure(code: 100, errorResponse: 'invalid Response');
    } on HttpException {
      return Failure(code: 101, errorResponse: 'no internet response');
    } on FormatException {
      return Failure(code: 102, errorResponse: 'invalid format');
    } on SocketException {
      return Failure(code: 104, errorResponse: 'No internet connection');
    } catch (e) {
      return Failure(code: 103, errorResponse: 'unknow n error ');
    }
  }
}
