import '../domain.dart';

abstract class AuthDataSource {
  Future<IAccount> login(String email, String password, String token);
}
