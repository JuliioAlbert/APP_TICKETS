import 'dart:convert';

class NewUser {
  final String name;
  final String password;
  final String email;
  final String phone;
  final int cia;
  final int pla;
  final int empresa;
  final String token;
  final int plaMaster;

  NewUser({
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
    required this.cia,
    required this.pla,
    required this.empresa,
    required this.token,
    required this.plaMaster,
  });

  NewUser copyWith({
    String? name,
    String? password,
    String? email,
    String? phone,
    int? cia,
    int? pla,
    int? empresa,
    String? token,
    int? plaMaster,
  }) =>
      NewUser(
        name: name ?? this.name,
        password: password ?? this.password,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        cia: cia ?? this.cia,
        pla: pla ?? this.pla,
        empresa: empresa ?? this.empresa,
        token: token ?? this.token,
        plaMaster: plaMaster ?? this.plaMaster,
      );

  factory NewUser.fromRawJson(String str) => NewUser.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewUser.fromJson(Map<String, dynamic> json) => NewUser(
        name: json["Name"],
        password: json["Password"],
        email: json["Email"],
        phone: json["Phone"],
        cia: json["Cia"],
        pla: json["Pla"],
        empresa: json["Empresa"],
        token: json["Token"],
        plaMaster: json["PlaMaster"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Password": password,
        "Email": email,
        "Phone": phone,
        "Cia": cia,
        "Pla": pla,
        "Empresa": empresa,
        "Token": token,
        "PlaMaster": plaMaster,
      };
}
