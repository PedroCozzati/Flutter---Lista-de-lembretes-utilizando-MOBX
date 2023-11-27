import '../entity/user.dart';

abstract class IUserRepository{
  Future<dynamic> verifyUser(user,pwd);
}