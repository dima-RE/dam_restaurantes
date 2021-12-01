import 'package:flutter/material.dart';
import 'package:project_06/widgets/image_box.dart';

class ProductoPreview extends StatelessWidget {
  //const ProductoPreview({Key? key}) : super(key: key);
  final String img, nom, prec, det;

  ProductoPreview({
    this.img = "",
    this.nom = "",
    this.prec = "",
    this.det = "",
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text(nom),
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
                        child: ImagePic(img: img),
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
                      nom,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      'Precio: \$ ' + prec,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                  det,
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
                      //Navigator.pop(context);
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red[400]),
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
