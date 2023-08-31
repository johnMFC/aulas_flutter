import 'package:flutter/material.dart';
import './questao.dart';
import './respostas.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      { 
        'texto' : ' Qual é sua cor favorita?',
        'resposta' : [ 'Preto','Vermelho', 'Laranja','Roxo'],

      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'resposta' : [ 'Cachorro','Coelho', 'Gato','Leão' ],
      },
      {
        'texto' : 'Qual é seu instrutor favorito ?',
        'resposta' : [ 'Maria','joão', 'John','vitor' ],
      }
       ];

       List<String> resposta = perguntas[_perguntaSelecionada].cast()['resposta'];

       /*for( String  textoResp in resposta ){
          widgets.add(Resposta(textoResp, _responder));
       }*/

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]['texto'] .toString()),
           ...resposta.map((t) => Resposta(t,_responder)).toList(),
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
