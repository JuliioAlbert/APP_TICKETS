import 'package:gen_soportes/features/auth/domain/domain.dart';
import 'package:dio/dio.dart';
import 'package:gen_soportes/features/auth/infrastructure/mappers/mapperts.dart';

import '../../../../config/constant/environment.dart';
import '../errors/auth_errors.dart';

class AuthDataSourceImp extends AuthDataSource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.baseURL,
  ));

  @override
  Future<IAccount> login(String email, String password) async {
    try {
      final response = await dio.post('/api/soportes/account/login',
          data: {'account': email, 'password': password});

      final account = AuthMappert.jsonToEntity(response.data);
      return account;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError(
            e.response?.data['message'] ?? 'Credenciales incorrectas');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexión a internet');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

// TODO FALTA REGISTRO
  @override
  Future<IAccount> register(String email, String password, String fullName) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
