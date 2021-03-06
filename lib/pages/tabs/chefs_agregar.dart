import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:project_06/provider/restaurante_provider.dart';

class ChefsAgregar extends StatefulWidget {
  ChefsAgregar({Key? key}) : super(key: key);

  @override
  _ChefsAgregarState createState() => _ChefsAgregarState();
}

class _ChefsAgregarState extends State<ChefsAgregar> {
  PortiProvider provider = PortiProvider();
  TextEditingController rutCtrl = TextEditingController();
  TextEditingController nomCtrl = TextEditingController();
  TextEditingController espCtrl = TextEditingController();
  int resCtrl = 0;
  String errorRut = '';
  String errorNom = '';
  String errorEsp = '';
  String errorRes = '';

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
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                errorRut,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            TextField(
              controller: nomCtrl,
              decoration: InputDecoration(
                  labelText: 'Nombre', hintText: 'Nombre del chef'),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                errorNom,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            TextField(
              controller: espCtrl,
              decoration: InputDecoration(
                  labelText: 'Especialidad',
                  hintText: 'Especialidad gastronómica del chef'),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                errorEsp,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: FutureBuilder(
                future: provider.getRestaurantes(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return FadingText('Cargando...');
                  } else {
                    return DropdownButton<int>(
                      value: resCtrl,
                      hint: Text('Restaurantes'),
                      isExpanded: true,
                      items: snapshot.data.map<DropdownMenuItem<int>>((rest) {
                        return DropdownMenuItem<int>(
                          child: Text(rest['nombre']),
                          value: rest['id'],
                        );
                      }).toList(),
                      onChanged: (rest) {
                        setState(() {
                          resCtrl = rest!;
                        });
                      },
                    );
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                errorRes,
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
                  var respuesta = await provider.postChef(
                    rutCtrl.text.trim(),
                    nomCtrl.text.trim(),
                    espCtrl.text.trim(),
                    resCtrl,
                  );
                  if (respuesta['message'] != null) {
                    var err = respuesta['errors'];
                    setState(() {
                      errorRut = err['rut'] != null ? err['rut'][0] : '';
                      errorNom = err['nombre'] != null ? err['nombre'][0] : '';
                      errorEsp = err['especialidad'] != null
                          ? err['especialidad'][0]
                          : '';
                      errorRes = err['restaurante_id'] != null
                          ? err['restaurante_id'][0]
                          : '';
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
