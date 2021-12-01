import 'package:flutter/material.dart';
import 'package:project_06/widgets/image_box.dart';

class RestaurantePreview extends StatefulWidget {
  final String img, nom, cal, ciu;

  const RestaurantePreview({
    this.img = '',
    this.nom = '',
    this.cal = '',
    this.ciu = '',
  });

  @override
  _RestaurantePreviewState createState() => _RestaurantePreviewState();
}

class _RestaurantePreviewState extends State<RestaurantePreview> {
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Restaurante'),
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
                      'Calle: ' + widget.cal,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      'Ciudad: ' + widget.ciu,
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
