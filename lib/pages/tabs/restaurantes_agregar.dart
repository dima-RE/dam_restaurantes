import 'package:flutter/material.dart';
import 'package:project_06/provider/restaurante_provider.dart';

class RestaurantesAgregar extends StatefulWidget {
  RestaurantesAgregar({Key? key}) : super(key: key);

  @override
  _RestaurantesAgregarState createState() => _RestaurantesAgregarState();
}

class _RestaurantesAgregarState extends State<RestaurantesAgregar> {
  TextEditingController nomCtrl = TextEditingController();
  TextEditingController calCtrl = TextEditingController();
  TextEditingController ciuCtrl = TextEditingController();
  String errorNom = '';
  String errorCal = '';
  String errorCiu = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Restaurante'),
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
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                errorNom,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            TextField(
              controller: calCtrl,
              decoration: InputDecoration(
                  labelText: 'Calle', hintText: 'Ej: Las Camelias #2324'),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                errorCal,
                style: Theme.of(context).textTheme.headline3,
              ),
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
                errorCiu,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green[400]),
                child: Text('Agregar el restaurante'),
                onPressed: () async {
                  PortiProvider provider = PortiProvider();
                  var respuesta = await provider.postRestaurante(
                    nomCtrl.text.trim(),
                    calCtrl.text.trim(),
                    ciuCtrl.text.trim(),
                  );
                  if (respuesta['message'] != null) {
                    var err = respuesta['errors'];
                    setState(() {
                      errorNom = err['nombre'] != null ? err['nombre'][0] : '';
                      errorCal = err['calle'] != null ? err['calle'][0] : '';
                      errorCiu = err['ciudad'] != null ? err['ciudad'][0] : '';
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
