import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final String texto;
  final void Function() quandoClicar;

  Questionario(this.texto, this.quandoClicar);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(
          this.texto,
          style: TextStyle(fontSize: 15,
          color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        color: Colors.blue,
        onPressed: quandoClicar,
      ),
    );
  }
}
