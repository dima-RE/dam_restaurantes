import 'package:flutter/material.dart';
import 'package:project_06/provider/restaurante_provider.dart';

class ChefsAgregar extends StatefulWidget {
  ChefsAgregar({Key? key}) : super(key: key);

  @override
  _ChefsAgregarState createState() => _ChefsAgregarState();
}

class _ChefsAgregarState extends State<ChefsAgregar> {
  TextEditingController rutCtrl = TextEditingController();
  TextEditingController nomCtrl = TextEditingController();
  TextEditingController espCtrl = TextEditingController();
  TextEditingController resCtrl = TextEditingController();
  String errorLog = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Chef'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            TextField(
              controller: rutCtrl,
              decoration: InputDecoration(
                  labelText: 'Rut', hintText: 'Ej: 12.345.678-9'),
            ),
            TextField(
              controller: nomCtrl,
              decoration: InputDecoration(
                  labelText: 'Nombre', hintText: 'Nombre del chef'),
            ),
            TextField(
              controller: espCtrl,
              decoration: InputDecoration(
                  labelText: 'Especialidad',
                  hintText: 'Especialidad gastronómica del chef'),
            ),
            // cambiar por un box collapse de los restaurantes, que muestre el
            // nombre del restaurante y el valor de la ID de este
            TextField(
              controller: resCtrl,
              decoration: InputDecoration(
                  labelText: 'Restaurante', hintText: 'Ej: 1 para x'),
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
                child: Text('Agregar el chef'),
                onPressed: () async {
                  PortiProvider provider = PortiProvider();
                  var respuesta = await provider.postChef(
                      rutCtrl.text, nomCtrl.text, espCtrl.text, resCtrl.text);
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
