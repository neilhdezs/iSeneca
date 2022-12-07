import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class LoginProvider extends ChangeNotifier {
  final String _baseUrl = 'https://script.google.com/macros/s/AKfycbxzHVH8Z2gpCHnArWK2Hv6cPgMv6n1k8onM7MC9bVCweSXBi5NJdi23J2WbtHhDqq4NsA/exec?spreadsheetId=1Pxi8RZq7cOqRBqtKG3mQ_Ljnyg2otuLdGrNmdNGsRbc&sheet=';


  List<User> listUsuario = [];
  List<UserConvivencia> listConvivencia = [];
  List<UserExpulsado> listExpulsado = [];

  LoginProvider() {
    getListUsuario();
    getListConvivencia();
    getListExpulsado();
  }

    Future<String> _getJsonData(String url) async {
    var response = await http.get(Uri.parse(url));
    return response.body;
  }

  Future<List<User>> getListUsuario() async {
    var data = await _getJsonData('${_baseUrl}usuario');
  
    Iterable l = json.decode(data);
    listUsuario = List<User>.from(l.map((model) => User.fromMap(model)));

    return listUsuario;
  }

  Future<List<UserConvivencia>> getListConvivencia() async {
    var data = await _getJsonData('${_baseUrl}convivencia');
  
    Iterable l = json.decode(data);
    listConvivencia = List<UserConvivencia>.from(l.map((model) => UserConvivencia.fromMap(model)));

    return listConvivencia;
  }

  Future<List<UserExpulsado>> getListExpulsado() async {
    var data = await _getJsonData('${_baseUrl}expulsado');
  
    Iterable l = json.decode(data);
    listExpulsado = List<UserExpulsado>.from(l.map((model) => UserExpulsado.fromMap(model)));

    return listExpulsado;
  }

}
