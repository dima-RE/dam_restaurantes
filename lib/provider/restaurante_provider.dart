import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PortiProvider {
  //final String apiURL = 'http:10.0.2.2:8000/api';
  //final String apiURL = 'http://192.168.1.8:8000/api';
  final String apiURL = 'https://8ce5-167-250-55-101.ngrok.io/api';

// --------------- RESTAURANTES ---------------

  Future<List<dynamic>> getRestaurantes() async {
    var url = Uri.parse('$apiURL/restaurantes');
    var respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> postRestaurante(
      String nomR, String calR, String ciuR) async {
    var url = Uri.parse('$apiURL/restaurantes');
    var respuesta = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(
        <String, String>{
          'nombre': nomR,
          'calle': calR,
          'ciudad': ciuR,
        },
      ),
    );
    return jsonDecode(respuesta.body);
  }

  Future<LinkedHashMap<String, dynamic>> chRestaurante(
      int id, String nomR, String calR, String ciuR) async {
    var url = Uri.parse('$apiURL/restaurantes/$id');
    var respuesta = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(
        <String, String>{
          'nombre': nomR,
          'calle': calR,
          'ciudad': ciuR,
        },
      ),
    );
    return jsonDecode(respuesta.body);
  }

  Future<bool> getRestaurante(int id) async {
    var url = Uri.parse('$apiURL/restaurantes/$id');
    var respuesta = await http.get(url);
    return jsonDecode(respuesta.body);
  }

  Future<bool> delRestaurante(int id) async {
    var url = Uri.parse('$apiURL/restaurantes/$id');
    var respuesta = await http.delete(url);
    return respuesta.statusCode == 200;
  }

// --------------- CHEFS ---------------

  Future<List<dynamic>> getChefs() async {
    var url = Uri.parse('$apiURL/chefs');
    var respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

// JSON INT
  Future<LinkedHashMap<String, dynamic>> postChef(
      String rutC, String nomC, String espC, int restC) async {
    var url = Uri.parse('$apiURL/chefs');
    var respuesta = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(
        <String, dynamic>{
          'rut': rutC,
          'nombre': nomC,
          'especialidad': espC,
          'restaurante_id': restC,
        },
      ),
    );
    return jsonDecode(respuesta.body);
  }

  Future<LinkedHashMap<String, dynamic>> chChef(
      String rutC, String nomC, String espC, int restC) async {
    var url = Uri.parse('$apiURL/chefs/$rutC');
    var respuesta = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(
        <String, dynamic>{
          'rut': rutC,
          'nombre': nomC,
          'especialidad': espC,
          'restaurante_id': restC,
        },
      ),
    );
    return jsonDecode(respuesta.body);
  }

  Future<bool> getChef(String rut) async {
    var url = Uri.parse('$apiURL/chefs/$rut');
    var respuesta = await http.get(url);
    return jsonDecode(respuesta.body);
  }

  Future<bool> delChef(String rut) async {
    var url = Uri.parse('$apiURL/chefs/$rut');
    var respuesta = await http.delete(url);
    return respuesta.statusCode == 200;
  }

// --------------- PLATOS ---------------

  Future<List<dynamic>> getPlatos() async {
    var url = Uri.parse('$apiURL/platos');
    var respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

// JSON INT
  Future<LinkedHashMap<String, dynamic>> postPlato(
      String nomP, String descP, String chefP, int precP) async {
    var url = Uri.parse('$apiURL/platos');
    var respuesta = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(
        <String, dynamic>{
          'nombre': nomP,
          'descripcion': descP,
          'chef_id': chefP,
          'precio': precP,
        },
      ),
    );
    return jsonDecode(respuesta.body);
  }

  Future<LinkedHashMap<String, dynamic>> chPlato(
      int idP, String nomP, String descP, String chefP, int precP) async {
    var url = Uri.parse('$apiURL/platos/$idP');
    var respuesta = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(
        <String, dynamic>{
          'nombre': nomP,
          'descripcion': descP,
          'chef_id': chefP,
          'precio': precP,
        },
      ),
    );
    return jsonDecode(respuesta.body);
  }

  Future<bool> delPlato(int id) async {
    var url = Uri.parse('$apiURL/platos/$id');
    var respuesta = await http.delete(url);
    return respuesta.statusCode == 200;
  }

//if (VALOR.isEmpty){return [];}
//return VALUETYPE.parse(VALOR['etiqueta'].replaceAll(',', '.'))
}
