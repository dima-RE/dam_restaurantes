import 'package:flutter/material.dart';

class ImagePic extends StatelessWidget {
  const ImagePic({
    Key? key,
    required this.img,
  }) : super(key: key);

  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 270,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(50, 20)),
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: AssetImage('assets/images/productos/$img.jpg'),
        ),
      ),
    );
  }
}
