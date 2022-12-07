// To parse this JSON data, do
//
//     final usersConvivencia = usersConvivenciaFromMap(jsonString);

import 'dart:convert';

class UserConvivencia {
    UserConvivencia({
        required this.alumno,
        required this.curso,
        required this.fechaInicio,
        required this.fechaFin,
    });

    String alumno;
    String curso;
    String fechaInicio;
    String fechaFin;

    factory UserConvivencia.fromJson(String str) => UserConvivencia.fromMap(json.decode(str));

    factory UserConvivencia.fromMap(Map<String, dynamic> json) => UserConvivencia(
        alumno: json["Alumno"],
        curso: json["Curso"],
        fechaInicio: json["Fecha_Inicio"],
        fechaFin: json["Fecha_Fin"],
    );
}
