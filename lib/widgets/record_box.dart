import 'package:flutter/material.dart';

class BoxImage extends StatelessWidget {
  /*const boxImage({
    Key? key,
  }) : super(key: key);*/
  final String img, title;

  BoxImage({this.title = "", this.img = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 210,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(width: 2),
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage('assets/images/empresa/$img.jpg'),
          )),
      child: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          Container(
            height: 25,
            alignment: Alignment.bottomCenter,
            color: Colors.black54,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ],
      ),
    );
  }
}
