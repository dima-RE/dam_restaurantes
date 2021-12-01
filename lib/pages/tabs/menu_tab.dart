import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TabMenu extends StatelessWidget {
  final menu = [
    {
      'title': 'Restaurantes',
      'sub': 'Ubicación de los restaurantes',
      'icon': MdiIcons.mapMarkerOutline,
    },
    {
      'title': 'Chefs',
      'sub': 'Información sobre los chefs',
      'icon': MdiIcons.informationOutline,
    },
    {
      'title': 'Versión',
      'sub': 'Versión de la aplicación',
      'icon': MdiIcons.check,
    },
  ];
//Metodo de mapeo
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: menu.map<Widget>((m) {
              return Column(
                children: [
                  ListTile(
                    leading: Icon(m['icon'] as IconData, size: 35),
                    title: Text(m['title'].toString(),
                        style: Theme.of(context).textTheme.subtitle2),
                    subtitle: Text(m['sub'].toString(),
                        style: Theme.of(context).textTheme.bodyText2),
                    onTap: () {
                      Navigator.pushNamed(context, '/' + m['title'].toString());
                    },
                  ),
                  Divider(thickness: 1.0),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
