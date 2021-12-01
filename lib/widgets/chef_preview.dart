import 'package:flutter/material.dart';
import 'package:project_06/widgets/image_box.dart';

class ChefPreview extends StatefulWidget {
  final String img, nom, rut, esp, res;

  const ChefPreview({
    this.img = '',
    this.nom = '',
    this.rut = '',
    this.esp = '',
    this.res = '',
  });

  @override
  _ChefPreviewState createState() => _ChefPreviewState();
}

class _ChefPreviewState extends State<ChefPreview> {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
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
                      'Restaurante: ' + widget.res,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text(
                      'Modificar',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onPressed: () {
                      //Navigator.pop(context);
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      'Eliminar',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    onPressed: () {
                      //Navigator.pop(context);
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
}
