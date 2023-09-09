import 'package:flutter/material.dart';
import './questionario.dart';
import './resultados.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': 
      [
        {'texto':'Preto','pontuação':10}, 
        {'texto':'Vermelho','pontuação':5},
        {'texto':'Verde','pontuação':6}, 
        {'texto':'Branco','pontuação':8},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': 
      [
          {'texto':'Coelho','pontação':10}, 
          {'texto':'Cobra' ,'pontação':5},
          {'texto':'Elefante','pontação':3},
          {'texto':'Leão'  ,'pontação':2},
      ],
    },
    {
      'texto': 'Qual é o seu instrutor favorito?',
      'respostas': 
      [
        {'texto':'Maria','pontuação':10 }, 
        {'texto':'João' ,'pontuação':5 }, 
        {'texto':'Leo'  ,'pontuação':8 },
        {'texto':'Pedro','pontuação':7 },
        
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
    print(_pontuacaoTotal);
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
                perguntaselecionada: _perguntaSelecionada,
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
