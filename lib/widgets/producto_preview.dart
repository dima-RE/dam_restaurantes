import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_06/pages/tabs/platos_modificar.dart';
import 'package:project_06/provider/restaurante_provider.dart';
import 'package:project_06/widgets/image_box.dart';

class ProductoPreview extends StatefulWidget {
  int id, prec;
  final String img, nom, det, chef;

  ProductoPreview({
    Key? key,
    this.id = 0,
    this.img = "",
    this.nom = "",
    this.prec = 0,
    this.chef = '',
    this.det = "",
  }) : super(key: key);

  @override
  _ProductoPreviewState createState() => _ProductoPreviewState();
}

class _ProductoPreviewState extends State<ProductoPreview> {
  var fp = NumberFormat.currency(decimalDigits: 0, locale: 'es-CL', symbol: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.nom),
          elevation: 0,
        ),
        body: Container(
          child: Column(
            children: [
              Flexible(
                child: Container(
                  width: double.infinity,
                  height: 350,
                  color: Colors.deepPurple[300],
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        bottom: 10,
                        left: 200,
                        child: Container(
                          color: Colors.black26,
                          width: 200,
                          height: 180,
                        ),
                      ),
                      Positioned(
                        bottom: 200,
                        left: 40,
                        child: Container(
                          color: Colors.white54,
                          width: 140,
                          height: 140,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: ImagePic(img: widget.img),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  children: [
                    Text(
                      widget.nom,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      'Precio: \$ ' + fp.format(widget.prec),
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  widget.det,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue[400]),
                    child: Text(
                      'Modificar',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onPressed: () {
                      MaterialPageRoute route = MaterialPageRoute(
                          builder: (context) => PlatosModificar(
                                id: widget.id,
                                nom: widget.nom,
                                des: widget.det,
                                chef: widget.chef,
                                pre: widget.prec.toString(),
                              ));
                      Navigator.push(context, route).then((value) {
                        setState(
                            () {}); // corregir actualizacion, llamando a getChef
                      });
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red[400]),
                    child: Text(
                      'Eliminar',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onPressed: () async {
                      PortiProvider provider = PortiProvider();
                      await confirmDialog(context, widget.nom).then((confirm) {
                        if (confirm) {
                          setState(() {
                            provider.delPlato(widget.id).then((delOK) {
                              if (!delOK) {
                                Snackbar('Ha ocurrido un error');
                              } else {
                                Snackbar(
                                    'El plato ${widget.nom} ha sido eliminado');
                                Navigator.pop(context);
                              }
                            });
                          });
                        }
                      });
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      'Volver',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ));
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
