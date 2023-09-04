import 'package:flutter/material.dart';
import './questionario.dart';
import './resultados.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': 
      [
      {'texto':'Preto','nota':10}, 
   {'texto':'Vermelho','nota':5},
      {'texto':'Verde','nota':6}, 
     {'texto':'Branco','nota':8},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': 
      [
        {'texto':'Coelho','nota':10}, 
        {'texto':'Cobra' ,'nota':5},
        {'texto':'Elefante','nota':3},
        {'texto':'Leão'  ,'nota':2},
          ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': 
      [
        {'texto''Maria','notas':10 }, 
        {'texto''João' ,'notas':5 }, 
        {'texto''Leo'  ,'notas':8 },
        {'texto''Pedro','notas':7 },
        ],
    },
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }
   bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }


  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder,
              )
              :Resultado(),
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
