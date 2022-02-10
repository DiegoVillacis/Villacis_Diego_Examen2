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