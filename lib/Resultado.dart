import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  final int resultQuestions;
  final Function() reiniciar;

  Resultado(this.resultQuestions,this.reiniciar);

  @override
  _ResultadoState createState() => _ResultadoState();
}

// entre a classe de referenicia e a classe principal!

class _ResultadoState extends State<Resultado> {
  
  String textResult;

  @override
  Widget build(BuildContext context) {
    
    if (this.widget.resultQuestions <= 7) {
      this.textResult = 'Tente da proxima!';
    } else if (this.widget.resultQuestions <= 10) {
      this.textResult = 'Parabéns Tirou a Média!';
    } else {
      this.textResult = 'Parabéns Você e um Jedi!';
    }

    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(50.0),
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              this.textResult,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            child: FlatButton(
              child: Text('Reiniciar?',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15.0
              ),
              ),
              onPressed: this.widget.reiniciar),
          ),
        ],
      ),
    );
  }
}
