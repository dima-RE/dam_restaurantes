import 'dart:convert';
import 'package:http/http.dart' as http;

/**
 * Vasorguesa
 * 9000
 * Porque lo extravagante no es lo único que trabajamos. Hemos traído esta espectacular obra de arte de nuestro chef maestro, quién se inspiró luego de leer una serie de mangas en sus vacaciones (sí, el chef adora los mangas).
 */
class PortiProvider {
  //final String apiURL = 'http:10.0.2.2:8000/api';
  //final String apiURL = 'http://192.168.1.8:8000/api';
  final String apiURL = 'https://5e87-167-250-55-101.ngrok.io/api';

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

  postRestaurante(String nomR, String calR, String ciuR) async {
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

  Future<bool> getRestaurante(String id) async {
    var url = Uri.parse('$apiURL/restaurantes/$id');
    var respuesta = await http.get(url);
    return jsonDecode(respuesta.body);
  }

  Future<bool> delRestaurante(String id) async {
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
  postChef(String rutC, String nomC, String espC, String restC) async {
    var url = Uri.parse('$apiURL/chefs');
    var respuesta = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(
        <String, String>{
          'rut': rutC,
          'nombre': nomC,
          'especialidad': espC,
          'restaurante_id': restC.toString(),
        },
        /*<String,int>{
          'precio':precP,
        },*/
      ),
    );
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
  postPlato(String nomP, String descP, int precP) async {
    var url = Uri.parse('$apiURL/platos');
    var respuesta = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(
        <String, String>{
          'nombre': nomP,
          'descripcion': descP,
          'precio': precP.toString(),
        },
        /*<String,int>{
          'precio':precP,
        },*/
      ),
    );
    return jsonDecode(respuesta.body);
  }

  Future<bool> delPlato(String id) async {
    var url = Uri.parse('$apiURL/platos/$id');
    var respuesta = await http.delete(url);
    return respuesta.statusCode == 200;
  }

//if (VALOR.isEmpty){return [];}
//return VALUETYPE.parse(VALOR['etiqueta'].replaceAll(',', '.'))
}
