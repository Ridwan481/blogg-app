import 'package:flutter/material.dart';

class Politice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(),
    );
  }

  listofcontext() {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          color: Colors.pink,
        )
      ],
    );
  }
}
