import 'package:flutter/material.dart';

class PlatosAgregar extends StatefulWidget {
  PlatosAgregar({Key? key}) : super(key: key);

  @override
  _PlatosAgregarState createState() => _PlatosAgregarState();
}

class _PlatosAgregarState extends State<PlatosAgregar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Plato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Text('data'),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Plato', hintText: 'Nombre del plato'),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Descripción', hintText: 'Describa el plato'),
            ),
            TextField(
              decoration:
                  InputDecoration(labelText: 'Precio', hintText: 'Ej: 9000'),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.green[400]),
                child: Text('Agregar el plato'),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
