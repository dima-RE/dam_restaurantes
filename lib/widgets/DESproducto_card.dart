import 'package:flutter/material.dart';
import 'package:project_06/widgets/image_box.dart';
import 'package:project_06/widgets/producto_preview.dart';

class ProductoCard extends StatelessWidget {
  //const ProductoPreview({Key? key}) : super(key: key);
  final String img, nom, prec, det;

  ProductoCard({
    this.img = "",
    this.nom = "",
    this.prec = "",
    this.det = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // Contenedor del elemento
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 450,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(7.0)),
        border: Border.all(color: Colors.indigoAccent),
      ),
      // Elemento
      child: Column(
        children: [
          ImagePic(img: img),
          Container(
            margin: EdgeInsets.all(5),
            child: Column(
              children: [
                Text(
                  nom,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  'Precio: \$ $prec',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Text(
                        'Ver',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductoPreview(
                                    img: img,
                                    nom: nom,
                                    prec: prec,
                                    det: det,
                                  )),
                        );
                      },
                    ),
                    ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.blue[400]),
                      child: Text(
                        'Modificar',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      onPressed: () {
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductoPreview(
                                    img: img,
                                    nom: nom,
                                    prec: prec,
                                    det: det,
                                  )),
                        );*/
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red[400]),
                      child: Text(
                        'Eliminar',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      onPressed: () {
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductoPreview(
                                    img: img,
                                    nom: nom,
                                    prec: prec,
                                    det: det,
                                  )),
                        );*/
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
