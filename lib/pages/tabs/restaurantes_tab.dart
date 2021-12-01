import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:project_06/pages/tabs/restaurantes_agregar.dart';
import 'package:project_06/provider/restaurante_provider.dart';
//import 'package:project_06/widgets/DESrestaurante_preview.dart';

class TabRestaurantes extends StatefulWidget {
  TabRestaurantes({Key? key}) : super(key: key);

  @override
  _TabRestaurantesState createState() => _TabRestaurantesState();
}

class _TabRestaurantesState extends State<TabRestaurantes> {
  PortiProvider restaurantes = new PortiProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurantes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                child: FutureBuilder(
                  future: restaurantes.getRestaurantes(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData ||
                        snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: JumpingText('Cargando...'));
                    } else {
                      /*return DataTable(
                        columns: [
                          DataColumn(label: Text('Nombre')), etc
                        ],
                        rows: snapshot.data.map<DataRow>((rest) {
                          return DataRow(cells: [
                            DataCell(Text(rest['nombre'])), etc
                          ]);
                        }).toList(),
                      );*/
                      return ListView.separated(
                        separatorBuilder: (_, __) => Divider(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(MdiIcons.tableChair),
                            title: Text(snapshot.data[index]['nombre']),
                            subtitle: Text(snapshot.data[index]['calle'] +
                                ', ' +
                                snapshot.data[index]['ciudad']),
                            /*onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RestaurantePreview(
                                          //img: 'c' + index.toString(),
                                          img: 'p1',
                                          nom: snapshot.data[index]['nombre'],
                                          cal: snapshot.data[index]['calle'],
                                          ciu: snapshot.data[index]['ciudad'],
                                        )),
                              );
                            },*/
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  //padding: EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    child: Text('Agregar'),
                    onPressed: () {
                      MaterialPageRoute route = MaterialPageRoute(
                          builder: (context) => RestaurantesAgregar());
                      Navigator.push(context, route).then((value) {
                        setState(() {});
                        ;
                      });
                    },
                  ),
                ),
                Container(
                  //padding: EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    child: Text('Modificar'),
                    onPressed: () {
                      // ruta a view modificar
                    },
                  ),
                ),
                Container(
                  //padding: EdgeInsets.symmetric(horizontal: 5),
                  child: ElevatedButton(
                    child: Text('Eliminar'),
                    onPressed: () {
                      // ruta a view Borrar
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
