
import '../entities/account.dart';

abstract class AuthRepository {
  Future<IAccount> login(String email, String password);
  Future<IAccount> register(String email, String password, String fullName);
}
