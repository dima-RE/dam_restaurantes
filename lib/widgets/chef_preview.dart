import 'package:flutter/material.dart';
import 'package:project_06/pages/tabs/chefs_modificar.dart';
import 'package:project_06/provider/restaurante_provider.dart';
import 'package:project_06/widgets/image_box.dart';

class ChefPreview extends StatefulWidget {
  int res;
  String img, nom, rut, esp;

  ChefPreview({
    this.img = '',
    this.nom = '',
    this.rut = '',
    this.esp = '',
    this.res = 0,
  });

  @override
  _ChefPreviewState createState() => _ChefPreviewState();
}

class _ChefPreviewState extends State<ChefPreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chef'),
          elevation: 0,
        ),
        body: Container(
          child: Column(
            children: [
              Flexible(
                child: Container(
                  width: double.infinity,
                  height: 350,
                  color: Colors.deepPurple[400],
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        bottom: 150,
                        left: 200,
                        child: Container(
                          color: Colors.black26,
                          width: 200,
                          height: 180,
                        ),
                      ),
                      Positioned(
                        bottom: 20,
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
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  widget.nom,
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rut: ' + widget.rut,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      'Especialidad: ' + widget.esp,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      'Restaurante: ' + widget.res.toString(),
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
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
                          builder: (context) => ChefsModificar(
                                rut: widget.rut,
                                nom: widget.nom,
                                esp: widget.esp,
                                res: widget.res,
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
                            provider.delChef(widget.rut).then((delOK) {
                              if (!delOK) {
                                Snackbar('Ha ocurrido un error');
                              } else {
                                Snackbar(
                                    'El chef ${widget.nom} ha sido eliminado');
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
          content: Text('Se eliminará a $texto'),
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
