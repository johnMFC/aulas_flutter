import 'package:flutter/widgets.dart';
import './questao.dart';
import './respostas.dart';

class Questionario  extends StatelessWidget {
  @override
  final List <Map<String,Object>> perguntas;
  final int perguntaselecionada;
  final void Function(int)quandoResponder;

 Questionario({
    required this.perguntas,
    required this.perguntaselecionada,
    required this.quandoResponder,
  });
  
  bool get temPerguntaSelecionada {
    return perguntaselecionada < perguntas.length;
  }



  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaselecionada]['respostas']
            as List<Map<String, Object>>
        : [];
    return  Column(
                children: [
                  Questao(perguntas[perguntaselecionada]['texto'] as String),
                 ...respostas
            .map((resp) => Resposta(resp['texto'] as String, quandoResponder))
            .toList(),
                ],
              );
  
  }

}