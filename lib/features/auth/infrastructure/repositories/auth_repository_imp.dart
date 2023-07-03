import 'package:gen_soportes/features/auth/domain/domain.dart';
import 'package:gen_soportes/features/auth/infrastructure/datasource/auth_datasource_imp.dart';

class AuthRepositoryImp extends AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImp({AuthDataSource? dataSource})
      : dataSource = dataSource ?? AuthDataSourceImp();

  @override
  Future<IAccount> login(String email, String password) {
    return dataSource.login(email, password);
  }

  @override
  Future<IAccount> register(String email, String password, String fullName) {
    return dataSource.register(email, password, fullName);
  }
}
