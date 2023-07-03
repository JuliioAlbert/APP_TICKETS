import '../domain.dart';

abstract class AuthDataSource {
  Future<IAccount> login( String email, String password );
  Future<IAccount> register( String email, String password, String fullName );
}