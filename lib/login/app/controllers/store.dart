import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:test_flutter/login/data/datasource/user_datasource.dart';
import 'package:test_flutter/login/data/repos/user_impl_repository.dart';
import 'package:test_flutter/login/external/datasources/user_impl_datasource.dart';

import '../../domain/repos/user_repository.dart';

part 'store.g.dart';

class UserStore = _UserStore with _$UserStore;
final IUserDataSource userDataSource = UserDatasourceImpl();

abstract class _UserStore with Store {
  final IUserRepository userRepository = UserRepositoryImp(userDataSource);

  @observable
  bool value = false;

  @action
  Future login(user,pwd) async {
    var resultUser = await userRepository.verifyUser(user,pwd);
    if (resultUser ==true){
      return true;
    }
    else{
      return false;
    }
  }

  @action
  void toggleValue() {
    value = !value;
  }

  loginHandler(result, context){
    switch(result){
      case true:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case false:
        return Fluttertoast.showToast(
          msg: 'Usuário ou senha incorretos',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.tealAccent.shade100,
          textColor: Colors.black,
        );
      default:
        return Fluttertoast.showToast(
          msg: 'Algo deu errado',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.tealAccent.shade100,
          textColor: Colors.black,
        );
    }
  }


}