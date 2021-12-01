import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:project_06/pages/tabs/restaurantes_agregar.dart';
//import 'package:project_06/pages/tabs/restaurantes_eliminar.dart';
import 'package:project_06/pages/tabs/restaurantes_modificar.dart';
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
                    if (!snapshot
                            .hasData /* ||
                        snapshot.connectionState == ConnectionState.waiting*/
                        ) {
                      return Center(child: JumpingText('Cargando...'));
                    } else {
                      return ListView.separated(
                        separatorBuilder: (_, __) => Divider(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Slidable(
                            child: ListTile(
                              leading: Icon(MdiIcons.tableChair),
                              title: Text(snapshot.data[index]['nombre']),
                              subtitle: Text(snapshot.data[index]['calle'] +
                                  ', ' +
                                  snapshot.data[index]['ciudad']),
                            ),
                            startActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    MaterialPageRoute route = MaterialPageRoute(
                                      builder: (context) =>
                                          RestaurantesModificar(
                                        id: snapshot.data[index]['id'],
                                        nom: snapshot.data[index]['nombre'],
                                        cal: snapshot.data[index]['calle'],
                                        ciu: snapshot.data[index]['ciudad'],
                                      ),
                                    );
                                    Navigator.push(context, route)
                                        .then((value) {
                                      setState(() {});
                                    });
                                  },
                                  backgroundColor: Colors.blue.shade400,
                                  icon: MdiIcons.pen,
                                  label: 'Modificar',
                                )
                              ],
                            ),
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    var nombre = snapshot.data[index]['nombre'];
                                    confirmDialog(context, nombre)
                                        .then((confirma) {
                                      if (confirma) {
                                        setState(() {
                                          restaurantes
                                              .delRestaurante(
                                                  snapshot.data[index]['id'])
                                              .then((delOK) {
                                            if (!delOK) {
                                              Snackbar('Ha ocurrido un error');
                                            } else {
                                              Snackbar(
                                                  'Restaurante $nombre eliminado');
                                              snapshot.data.removeAt(index);
                                            }
                                          });
                                        });
                                      }
                                    });
                                  },
                                  backgroundColor: Colors.red.shade400,
                                  icon: MdiIcons.trashCan,
                                  label: 'Eliminar',
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green[400]),
                child: Text('Agregar'),
                onPressed: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (context) => RestaurantesAgregar());
                  Navigator.push(context, route).then((value) {
                    setState(() {});
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void Snackbar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(duration: Duration(seconds: 2), content: Text(mensaje)));
  }
}

Future<dynamic> confirmDialog(BuildContext context, String texto) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('¿Confirmar la eliminación?'),
          content: Text('Se eliminará $texto'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text('Eliminar'),
            ),
          ],
        );
      });
}

// -- DATA TABLE
/*return DataTable(
                        columns: [DataColumn(label: Text('Nombre')), etc],
                        rows: snapshot.data.map<DataRow>((rest) {
                          return DataRow(cells: [DataCell(Text(rest['nombre'])), etc]);
                        }).toList(),
                      );*/

// -- TAP
/*onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                    builder: (context) => RestaurantePreview(parameters),),);
                            },*/