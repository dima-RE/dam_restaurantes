import 'package:flutter/material.dart';
import 'package:project_06/provider/restaurante_provider.dart';

class RestaurantesEliminar extends StatefulWidget {
  RestaurantesEliminar({Key? key}) : super(key: key);

  @override
  _RestaurantesEliminarState createState() => _RestaurantesEliminarState();
}

class _RestaurantesEliminarState extends State<RestaurantesEliminar> {
  TextEditingController nomCtrl = TextEditingController();
  TextEditingController calCtrl = TextEditingController();
  TextEditingController ciuCtrl = TextEditingController();
  String errorLog = '';
// MODIFICAR PARA DROPDOWN ID + GET
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eliminar Restaurante'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            TextField(
              controller: nomCtrl,
              decoration: InputDecoration(
                  labelText: 'Nombre', hintText: 'Nombre del restaurante'),
            ),
            TextField(
              controller: calCtrl,
              decoration: InputDecoration(
                  labelText: 'Calle', hintText: 'Ej: Las Camelias #2324'),
            ),
            TextField(
              controller: ciuCtrl,
              decoration: InputDecoration(
                  labelText: 'Ciudad',
                  hintText: 'Ciudad en el que se encuentra'),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                errorLog,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green[400]),
                child: Text('Eliminar el restaurante'),
                onPressed: () async {
                  PortiProvider provider = PortiProvider();
                  var respuesta = await provider.postRestaurante(
                      nomCtrl.text, calCtrl.text, ciuCtrl.text);
                  if (respuesta['message'] != null) {
                    setState(() {
                      errorLog = respuesta['errors']['nombre'][0];
                    });
                  } else {
                    Navigator.pop(context);
                  }
                  ;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
