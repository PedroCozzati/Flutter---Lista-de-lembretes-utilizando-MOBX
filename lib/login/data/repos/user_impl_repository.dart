import 'package:test_flutter/login/domain/entity/user.dart';
import 'package:test_flutter/login/domain/errors/errors.dart';

import '../../domain/repos/user_repository.dart';
import '../datasource/user_datasource.dart';

class UserRepositoryImp implements IUserRepository {
  final IUserDataSource userDatasource;

  UserRepositoryImp(this.userDatasource);

  @override
  Future<dynamic> verifyUser(user,pwd) async {
    try{
      final result = await userDatasource.verifyUser(user,pwd);
      return result;
    } on Exception catch(e) {
      print(e);
      return Failure();
    }
  }
}