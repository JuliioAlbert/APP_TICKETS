import '../entities/account.dart';

abstract class AuthRepository {
  Future<IAccount> login(String email, String password, String token);
}
