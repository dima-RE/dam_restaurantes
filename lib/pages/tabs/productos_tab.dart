import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:project_06/pages/tabs/platos_agregar.dart';
import 'package:project_06/provider/restaurante_provider.dart';
import 'package:project_06/widgets/producto_preview.dart';

class TabProductos extends StatefulWidget {
  TabProductos({Key? key}) : super(key: key);

  @override
  _TabProductosState createState() => _TabProductosState();
}

class _TabProductosState extends State<TabProductos> {
  PortiProvider plato = new PortiProvider();
  var fp = NumberFormat.currency(decimalDigits: 0, locale: 'es-CL', symbol: '');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: plato.getPlatos(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: JumpingText('Cargando...'));
                } else {
                  return ListView.separated(
                    separatorBuilder: (_, __) => Divider(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(MdiIcons.foodForkDrink),
                        title: Text(snapshot.data[index]['nombre']),
                        subtitle: Text(
                            '\$' + fp.format(snapshot.data[index]['precio'])),
                        trailing: Icon(MdiIcons.menuRight),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductoPreview(
                                // hasta index 6 para prueba
                                id: snapshot.data[index]['id'],
                                img:
                                    'p' + snapshot.data[index]['id'].toString(),
                                nom: snapshot.data[index]['nombre'],
                                prec: snapshot.data[index]['precio'],
                                chef: snapshot.data[index]['chef_id'],
                                det: snapshot.data[index]['descripcion'],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: ElevatedButton(
              child: Text('Agregar Plato'),
              onPressed: () {
                MaterialPageRoute route =
                    MaterialPageRoute(builder: (context) => PlatosAgregar());
                Navigator.push(context, route).then((value) {
                  setState(() {});
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
