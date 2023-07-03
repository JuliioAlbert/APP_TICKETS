import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import '../../../shared/infrastructure/inputs/email.dart';
import '../../../shared/infrastructure/inputs/password.dart';

//! Implementar Notifier
class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  final Function(String, String) registerUserCallback;

  RegisterFormNotifier({
    required this.registerUserCallback,
  }) : super(RegisterFormState());

  onChangeEmpresa(int value) {
    state.copyWith(empresa: value);
  }

  onChangeNombre(String value) {
    state.copyWith(name: value);
  }

  onChangeCia(int value) {
    state.copyWith(cia: value);
  }

  onChangeEmail(String value) {
    final newEmail = Email.dirty(value);
    state.copyWith(
      email: newEmail,
      isValid: Formz.validate(
        [newEmail],
      ),
    );
  }

  onChangePhone(String value) {
    state = state.copyWith(phone: value);
  }

  onChangePla(int value) {
    state = state.copyWith(pla: value);
  }

  onChangePlaMaster(int value) {
    state = state.copyWith(plaMaster: value);
  }

  onSubmit() async {
    state = state.copyWith(isPosting: true);

    // await registerUserCallback()
  }
}

//! 1 State del la pagina
class RegisterFormState {
  final String? name;
  final Password? password;
  final Email? email;
  final String? phone;
  final int? cia;
  final int? pla;
  final int? empresa;
  final String? token;
  final int? plaMaster;
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;

  RegisterFormState({
    this.isFormPosted = false,
    this.isPosting = false,
    this.isValid = false,
    this.name,
    this.password = const Password.pure(),
    this.email = const Email.pure(),
    this.phone,
    this.cia,
    this.pla,
    this.empresa,
    this.token,
    this.plaMaster,
  });

  RegisterFormState copyWith({
    String? name,
    Password? password,
    Email? email,
    String? phone,
    int? cia,
    int? pla,
    int? empresa,
    String? token,
    int? plaMaster,
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
  }) =>
      RegisterFormState(
        name: name ?? this.name,
        password: password ?? this.password,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        cia: cia ?? this.cia,
        pla: pla ?? this.pla,
        empresa: empresa ?? this.empresa,
        token: token ?? this.token,
        plaMaster: plaMaster ?? this.plaMaster,
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
      );

//   @override
//   String toString() {
//     return '''

// ''';
//   }
}

class RegisterFormProvider {}
