import 'package:flutter/material.dart';

class NoInternetConnectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/close.png'))),
        ),
        SizedBox(height: 20),
        Text('Não foi possível se conectar ao servidor',
            style: TextStyle(
                color: Colors.red, fontSize: 22, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
        Text('Ocorreu um problema com sua conexão. Tente de novo.',
            style: TextStyle(color: Colors.red, fontSize: 16),
            textAlign: TextAlign.center)
      ],
    );
  }
}
