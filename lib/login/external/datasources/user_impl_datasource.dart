import 'dart:convert';

import '../../data/datasource/user_datasource.dart';
import 'package:http/http.dart' as http;

import '../../domain/errors/errors.dart';

class UserDatasourceImpl implements IUserDataSource {

  @override
  Future<dynamic> verifyUser(user,pwd) async {
    try {
      final result =
      await http.get(Uri.parse('https://6561981adcd355c08323f844.mockapi.io/api/v1/User'));
      var decodedJson = jsonDecode(result.body);

      if (result.statusCode == 200 || result.statusCode == 201) {
        //usuario: usuario1
        //senha: 123456
        //usuario fixo no mockAPI, o ideal seria ter um service no backend que validasse o login, porém o mockAPI tem apenas os endpoints basicos de uma api
        if(decodedJson[0]['name'] ==user && decodedJson[0]['pwd']==pwd) {
          return true;
        }
        return false;
      }
    } catch (e) {
      print(e);
      DataSourceError();
    }

    throw UserNotFound();
  }
}