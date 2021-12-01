import 'package:flutter/material.dart';
import 'package:project_06/provider/restaurante_provider.dart';

class RestaurantesModificar extends StatefulWidget {
  int id;
  String nom, cal, ciu;

  RestaurantesModificar(
      {Key? key, this.id = 0, this.nom = '', this.cal = '', this.ciu = ''})
      : super(key: key);
  @override
  _RestaurantesModificarState createState() => _RestaurantesModificarState();
}

class _RestaurantesModificarState extends State<RestaurantesModificar> {
  TextEditingController nomCtrl = TextEditingController();
  TextEditingController calCtrl = TextEditingController();
  TextEditingController ciuCtrl = TextEditingController();
  //String errorNom = '';String errorCal = '';String errorCiu = '';

  @override
  void initState() {
    super.initState();
    nomCtrl.text = widget.nom;
    calCtrl.text = widget.cal;
    ciuCtrl.text = widget.ciu;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar Restaurante'),
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
            /*Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                errorNom,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),*/
            TextField(
              controller: calCtrl,
              decoration: InputDecoration(
                  labelText: 'calle', hintText: 'Ej: Las Camelias #2324'),
            ),
            /*Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                errorCal,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),*/
            TextField(
              controller: ciuCtrl,
              decoration: InputDecoration(
                  labelText: "'Ciudad",
                  hintText: 'Ciudad en el que se encuentra'),
            ),
            /*Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                errorCiu,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),*/
            Spacer(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blue[400]),
                child: Text('Modificar el restaurante'),
                onPressed: () async {
                  PortiProvider provider = PortiProvider();
                  await provider.chRestaurante(
                      widget.id, nomCtrl.text, calCtrl.text, ciuCtrl.text);
                  /*if (respuesta['message'] != null) {
                    var err = respuesta['errors'];
                    setState(() {
                      errorNom =
                          err['nombre'] != null ? err['nombre'][0] : '';
                      errorCal = err['calle'] != null ? err['calle'][0] : '';
                      errorCiu =
                          err['ciudad'] != null ? err['ciudad'][0] : '';
                    });
                  } else {*/
                  Navigator.pop(context);
                  //};
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
