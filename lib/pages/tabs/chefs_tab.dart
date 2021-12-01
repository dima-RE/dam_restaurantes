import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:project_06/provider/restaurante_provider.dart';
import 'package:project_06/widgets/chef_preview.dart';
import 'chefs_agregar.dart';

class TabChefs extends StatefulWidget {
  TabChefs({Key? key}) : super(key: key);

  @override
  _TabChefsState createState() => _TabChefsState();
}

class _TabChefsState extends State<TabChefs> {
  PortiProvider chefs = new PortiProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chefs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: chefs.getChefs(),
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
                          leading: Icon(MdiIcons.chefHat),
                          title: Text(snapshot.data[index]['nombre']),
                          subtitle: Text(snapshot.data[index]['especialidad']),
                          trailing: Icon(MdiIcons.menuRight),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChefPreview(
                                        img: 'c' + index.toString(),
                                        nom: snapshot.data[index]['nombre'],
                                        rut: snapshot.data[index]['rut'],
                                        esp: snapshot.data[index]
                                            ['especialidad'],
                                        res: snapshot.data[index]
                                            ['restaurante_id']['nombre'],
                                        //.toString(),
                                      )),
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
                child: Text('Agregar Chef'),
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (context) => ChefsAgregar());
                  Navigator.push(context, route);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
