import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gen_soportes/config/db/db.dart';
import 'package:gen_soportes/features/auth/domain/domain.dart';
import 'package:gen_soportes/features/auth/infrastructure/errors/auth_errors.dart';
import 'package:gen_soportes/features/auth/infrastructure/mappers/auth_mapper.dart';

import '../../infrastructure/repositories/auth_repository_imp.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImp();

  return AuthNotifier(authRepository: authRepository);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthNotifier({required this.authRepository}) : super(AuthState()) {
    checkAuthStatus();
  }

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final user = await authRepository.login(email, password);
      _setLoggedUser(user);
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout('Error no controlado');
    }
  }

  void registerUser(String email, String password) async {}

  void checkAuthStatus() async {
    final auth = await AuthDBProvider.getAuth();

    if (auth == null) return logout();

    _setLoggedUser(auth);
  }

  void _setLoggedUser(IAccount user) async {
    await AuthDBProvider.saveAuth(AuthMappert.entityToJson(user));

    state = state.copyWith(
      user: user,
      authStatus: AuthStatus.authenticated,
      errorMessage: '',
    );
  }

  Future<void> logout([String? errorMessage]) async {
    await AuthDBProvider.deleteAuth();

    state = state.copyWith(
      authStatus: AuthStatus.notAuthenticated,
      user: null,
      errorMessage: errorMessage,
    );
  }
}

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {
  final AuthStatus authStatus;
  final IAccount? user;
  final String errorMessage;

  AuthState({
    this.authStatus = AuthStatus.checking,
    this.user,
    this.errorMessage = '',
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    IAccount? user,
    String? errorMessage,
  }) =>
      AuthState(
        authStatus: authStatus ?? this.authStatus,
        user: user ?? this.user,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
