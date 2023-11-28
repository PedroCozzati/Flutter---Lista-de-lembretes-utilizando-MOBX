import 'package:test_flutter/login/domain/entity/user.dart';

import '../repos/user_repository.dart';

abstract class IUserUseCase {
  Future<dynamic> call(user,pwd);
}

class UserUseCase implements IUserUseCase {
  final IUserRepository _repository;

  UserUseCase(this._repository);

  @override
  Future<dynamic> call(user,pwd) async {
    return _repository.verifyUser(user,pwd);
  }
}