import 'package:flutter/material.dart';

class TabVersion extends StatelessWidget {
  const TabVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Versión'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Versión: 1.0.0'),
            Text('Equipo desarrollador: Matrusca LTDA.'),
            Text('Fecha de versión: 11/2021'),
            Text('¿Esto es relleno?: Completamente'),
            Text('¿Esta mal hecho?: Es muy probable'),
            Text(
                '¿Es similar a la aplicación de restaurante Porti presentada hace unos meses atrás? No hay mucha creatividad que digamos.'),
            Image(image: AssetImage('assets/images/empresa/e3.jpg'))
          ],
        ),
      ),
    );
  }
}
