import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:project_06/provider/restaurante_provider.dart';

class PlatosModificar extends StatefulWidget {
  int id;
  String nom, des, chef, pre;

  PlatosModificar(
      {Key? key,
      this.id = 0,
      this.nom = '',
      this.des = '',
      this.pre = '',
      this.chef = ''})
      : super(key: key);

  @override
  _PlatosModificarState createState() => _PlatosModificarState();
}

class _PlatosModificarState extends State<PlatosModificar> {
  PortiProvider provider = PortiProvider();
  TextEditingController nomCtrl = TextEditingController();
  TextEditingController desCtrl = TextEditingController();
  TextEditingController preCtrl = TextEditingController();
  String chefCtrl = '';
  //String errorNom = '';String errorDes = '';String errorChe = '';String errorPre = '';

  @override
  void initState() {
    super.initState();
    nomCtrl.text = widget.nom;
    desCtrl.text = widget.des;
    chefCtrl = widget.chef;
    preCtrl.text = widget.pre;
    //preCtrl = ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modificar Plato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            TextField(
              controller: nomCtrl,
              decoration: InputDecoration(
                  labelText: 'Plato', hintText: 'Nombre del plato'),
            ),
            /*Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                errorNom,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),*/
            TextField(
              controller: desCtrl,
              decoration: InputDecoration(
                  labelText: 'Descripción', hintText: 'Describa el plato'),
            ),
            /*Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                errorDes,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),*/
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: FutureBuilder(
                future: provider.getChefs(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return FadingText('Cargando...');
                  } else {
                    return DropdownButton<String>(
                      value: chefCtrl == '' ? null : chefCtrl,
                      hint: Text('Chefs'),
                      isExpanded: true,
                      items:
                          snapshot.data.map<DropdownMenuItem<String>>((chef) {
                        return DropdownMenuItem<String>(
                          child: Text(chef['nombre']),
                          value: chef['rut'],
                        );
                      }).toList(),
                      onChanged: (chef) {
                        setState(() {
                          chefCtrl = chef!;
                        });
                      },
                    );
                  }
                },
              ),
            ),
            /*Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                errorChe,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),*/
            TextField(
              controller: preCtrl,
              decoration:
                  InputDecoration(labelText: 'Precio', hintText: 'Ej: 9000'),
            ),
            /*Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                errorPre,
                style: Theme.of(context).textTheme.headline3,
              ),
            ),*/
            Spacer(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green[400]),
                child: Text('Modificar el plato'),
                onPressed: () async {
                  var precio = preCtrl.text.trim().isEmpty
                      ? 0
                      : int.parse(preCtrl.text.trim());
                  var respuesta = await provider.chPlato(
                    widget.id,
                    nomCtrl.text.trim(),
                    desCtrl.text.trim(),
                    chefCtrl,
                    precio,
                  );
                  /*if (respuesta['message'] != null) {
                    var err = respuesta['errors'];
                    setState(() {
                      errorNom = err['nombre'] != null ? err['nombre'][0] : '';
                      errorDes = err['descripcion'] != null
                          ? err['descripcion'][0]
                          : '';
                      errorChe =
                          err['chef_id'] != null ? err['chef_id'][0] : '';
                      errorPre = err['precio'] != null ? err['precio'][0] : '';
                    });
                  } else {*/
                  Navigator.pop(context);
                  //}
                  //;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
