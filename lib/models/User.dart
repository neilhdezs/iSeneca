
import 'dart:convert';

class User {
    User({
        required this.id,
        required this.usuario,
        required this.clave,
        required this.nombreCompleto,
        required this.telefono,
        required this.mail,
        required this.nombreDelCentro,
    });

    String id;
    String usuario;
    String clave;
    String nombreCompleto;
    String telefono;
    String mail;
    String nombreDelCentro;

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        usuario: json["usuario"],
        clave: json["clave"],
        nombreCompleto: json["nombre_completo"],
        telefono: json["telefono"],
        mail: json["mail"],
        nombreDelCentro: json["nombre_del_centro"],
    );
}
