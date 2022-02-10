import 'package:firebase_auth/firebase_auth.dart';

class userModelVFDI {
  var id;
  String usuario = '';
  String contrase = '';
  String cedula = '';

  userModelVFDI(
    String id,
    String usuario,
    String contrase,
    String cedula,
  ) {
    this.id = id;
    this.usuario = usuario;
    this.contrase = contrase;
    this.cedula = cedula;
  }
}

class SignUpResponse {
  final String? error;
  final User? user;

  SignUpResponse(this.error, this.user);
}