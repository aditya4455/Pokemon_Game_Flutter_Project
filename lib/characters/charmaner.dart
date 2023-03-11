import 'package:flutter/material.dart';

class Charmander extends StatelessWidget {
  double x;
  double y;
  String location;
  Charmander({Key? key,required this.x,required this.y,required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (location == 'battlefinishedscreen') {
      return Container(
        alignment: Alignment(x,y),
        child: Image.asset(
          'lib/images/charmander.png',
          width: MediaQuery.of(context).size.width * 0.75,
          fit: BoxFit.cover,
        ),
      );
    }  else {
      return Container();
    }
  }
}
