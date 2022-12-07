// To parse this JSON data, do
//
//     final userExpulsado = userExpulsadoFromMap(jsonString);

import 'dart:convert';

class UserExpulsado {
    UserExpulsado({
        required this.alumno,
        required this.curso,
        required this.fechaInicio,
        required this.fechaFin,
    });

    String alumno;
    String curso;
    String fechaInicio;
    String fechaFin;

    factory UserExpulsado.fromJson(String str) => UserExpulsado.fromMap(json.decode(str));

    factory UserExpulsado.fromMap(Map<String, dynamic> json) => UserExpulsado(
        alumno: json["Alumno"],
        curso: json["Curso"],
        fechaInicio: json["Fecha_Inicio"],
        fechaFin: json["Fecha_Fin"],
    );
}
