import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:project_06/pages/tabs/inicio_tab.dart';
import 'package:project_06/pages/tabs/menu_tab.dart';
import 'package:project_06/pages/tabs/productos_tab.dart';

class RootPage extends StatefulWidget {
  RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  //https://encycolorpedia.gr/a83279
  //colorzilla
  int curIndex = 0;

  var pages = [
    {
      'pagina': TabIni(),
      'texto': 'Inicio',
      'icono': MdiIcons.homeOutline,
      'color': 0xFFA83279,
    },
    {
      'pagina': TabProductos(),
      'texto': 'Productos',
      'icono': MdiIcons.silverwareVariant,
      'color': 0xff59189e,
    },
    {
      'pagina': TabMenu(),
      'texto': 'Menú',
      'icono': MdiIcons.reorderHorizontal,
      'color': 0xffe094dd,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(pages[curIndex]['color'].toString())),
        leading: Icon(pages[curIndex]['icono'] as IconData),
        title: Text(pages[curIndex]['texto'].toString()),
      ),
      body: pages[curIndex]['pagina'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: pages.map((p) {
          return BottomNavigationBarItem(
            icon: Icon(p['icono'] as IconData),
            label: p['texto'].toString(),
            backgroundColor: Color(int.parse(p['color'].toString())),
          );
        }).toList(),
        currentIndex: curIndex,
        onTap: (index) {
          setState(() {
            curIndex = index;
          });
        },
      ),
    );
  }
}
