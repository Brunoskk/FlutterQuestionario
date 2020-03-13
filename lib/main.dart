import 'package:flutter/material.dart';
import 'package:project_one/Questionario.dart';
import 'package:project_one/Resultado.dart';

main() {
  runApp(PerguntaApp());
}

//

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

//

class _PerguntaAppState extends State<PerguntaApp> {
//
  var _perguntaSelecionada = 0;
  var _pontuacaoFinal = 0;

  final _perguntas = const [
    {
      'titulo': 'Qual seu bolo favorito?',
      'resposta': [
        {'texto': 'Chocolate', 'nota': 5},
        {'texto': 'Morango', 'nota': 3},
        {'texto': 'Limao', 'nota': 1},
      ]
    },
    {
      'titulo': 'Qual seu cachorro favorito?',
      'resposta': [
        {'texto': 'Dog Alemão', 'nota': 5},
        {'texto': 'Labrador  ', 'nota': 3},
        {'texto': 'Dalmata   ', 'nota': 1},
      ]
    },
    {
      'titulo': 'Qual seu nome favorito?',
      'resposta': [
        {'texto': 'Bruno', 'nota': 5},
        {'texto': 'José', 'nota': 3},
        {'texto': 'Maria', 'nota': 1}
      ]
    }
  ];

  bool get perguntaSelect {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    setState(() {
      this._perguntaSelecionada++;
      this._pontuacaoFinal += pontuacao;
    });
  }

void _reiniciarQuestionario(){

    setState(() {
      this._perguntaSelecionada = 0;
      this._pontuacaoFinal = 0;
    });

}
//

//
  @override
  Widget build(BuildContext context) {

    List<Map<String, Object>> respostas = perguntaSelect ? _perguntas[_perguntaSelecionada]['resposta'] : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Questionario'),
          ), //AppBar
        ),
        body: perguntaSelect
            ? Container(
              alignment: Alignment.center,
              color: Colors.lightBlueAccent,
              margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
              padding: EdgeInsets.all(20.0),
              constraints: BoxConstraints.tightForFinite(
                width: 300,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0,100.0,0,20.0),
                    child: Text(
                      _perguntas[_perguntaSelecionada]['titulo'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ...respostas
                      .map((res) => Questionario(
                          res['texto'], () => _responder(res['nota'])))
                      .toList(),
                ]),
            )
            : Resultado(this._pontuacaoFinal,this._reiniciarQuestionario), //body
      ), //Scaffold
    );
  }
}
