import 'dart:async';
import 'dart:convert' show json;

import 'package:flutter/material.dart';


class Alternativa {
  String codigo;
  String texto;

  Alternativa({
    this.codigo,
    this.texto
  });

  factory Alternativa.fromJson(Map<String, dynamic> json) {
    return Alternativa(
      codigo: json["codigo"],
      texto: json["texto"]
    );
  }
}

class Questao {
  String pergunta;
  String justificativa;
  String questao_correta;
  String alternativaAux;
  List<Alternativa> alternativas;

  Questao({
    this.pergunta,
    this.justificativa,
    this.questao_correta,
    this.alternativas,
    this.alternativaAux
  });

  factory Questao.fromJson(Map<String, dynamic> jsonResult) {

    return Questao(
      pergunta: jsonResult["pergunta"],
      justificativa: jsonResult["justificativa"],
      questao_correta: jsonResult["questao_correta"],
      alternativaAux: jsonResult["alternativas"].toString()
    );
  }

}