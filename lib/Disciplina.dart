import 'dart:async';
import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:flutter_app/Questao.dart';
import 'package:flutter_app/Resultado.dart';

void main(String a) {
  runApp(Disciplina(a));
}

class Disciplina extends StatelessWidget {
  final String jsonDisciplina;

  Disciplina(this.jsonDisciplina);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Fagammon', jsonDisciplina: this.jsonDisciplina),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.jsonDisciplina}) : super(key: key);

  final String title;
  final String jsonDisciplina;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;
  List<int> questoes_certas = [];
  List<int> questoes_erradas = [];
  Questao questao;
  Alternativa alternativa;
  List<Questao> questoes;
  int contadorQuestoes = 0;


  Future<void> lerJson() async {
    String data = "";
    data = await DefaultAssetBundle.of(context).loadString("assets/questoesSfn.json");
    if (widget.jsonDisciplina == "sfn") {
      data = await DefaultAssetBundle.of(context).loadString("assets/questoesSfn.json");
    } else if (widget.jsonDisciplina == "investimentos") {
      data = await DefaultAssetBundle.of(context).loadString("assets/questoesSfn.json");
    } else if (widget.jsonDisciplina == "mercado_futuro") {
      data = await DefaultAssetBundle.of(context).loadString("assets/questoesSfn.json");
    } else if (widget.jsonDisciplina == "taxa_juros") {
      data = await DefaultAssetBundle.of(context).loadString("assets/questoesTaxaJuros.json");
    } else if (widget.jsonDisciplina == "tcp") {
      data = await DefaultAssetBundle.of(context).loadString("assets/questoesTcp.json");
    } else if (widget.jsonDisciplina == "seguranca_na_internet") {
      data = await DefaultAssetBundle.of(context).loadString("assets/questoesSegurancaNaInternet.json");
    } else if (widget.jsonDisciplina == "flutter") {
      data = await DefaultAssetBundle.of(context).loadString("assets/questoesFlutter.json");
    }
    List<Questao> listaAux = [];
    List<Alternativa> listaAuternativaAux = [];
    for(var i = 0; i<5; i++) {
      for(var j = 0; j<4; j++) {
        alternativa = Alternativa.fromJson(json.decode(data)[i]["alternativas"][j]);
        listaAuternativaAux.add(alternativa);
      }
      questao = Questao.fromJson(json.decode(data)[i]);
      questao.alternativas = listaAuternativaAux;
      listaAuternativaAux = [];
      listaAux.add(questao);
    }
    questoes = listaAux;
    setState(() {});
  }
  void _value1Changed(bool value) => setState(() => {
    _value1 = value,
    if (_value1) {
      _value2 = false,
      _value3 = false,
      _value4 = false,
    }
  });

  void _value2Changed(bool value) => setState(() => {
    _value2 = value,
    if (_value2) {
      _value1 = false,
      _value3 = false,
      _value4 = false,
    }
  });

  void _value3Changed(bool value) => setState(() => {
    _value3 = value,
    if (_value3) {
      _value2 = false,
      _value1 = false,
      _value4 = false,
    }
  });

  void _value4Changed(bool value) => setState(() => {
    _value4 = value,
    if (_value4) {
      _value2 = false,
      _value3 = false,
      _value1 = false,
    }
  });

  Widget getAlternativas()
  {
    List<Widget> list = new List<Widget>();
    if (questoes != null) {
      for(var i = 0; i < questoes[contadorQuestoes].alternativas.length; i++){
        list.add(
            new CheckboxListTile(
              value: (i == 0)? _value1 : (i == 1) ? _value2 : (i == 2) ? _value3 : _value4,
              onChanged: (i == 0)? _value1Changed : (i == 1) ? _value2Changed : (i == 2) ? _value3Changed : _value4Changed,
              title: new Text(questoes[contadorQuestoes].alternativas[i].texto),
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.green,
            )
        );
      }
    }
    return new Column(children: list);
  }

  @override
  Widget build(BuildContext context) {
    lerJson();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        padding: new EdgeInsets.all(8.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: <Widget>[
                SizedBox(height: 60),
                Text(questoes != null ? questoes[contadorQuestoes].pergunta: "Carregando alternativas...",
                  style: TextStyle(fontSize: 20.0),),
                SizedBox(height: 40),
                getAlternativas()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Colors.greenAccent,
                    onPressed: () {
                        if (_value1) {
                          if (questoes[contadorQuestoes].questao_correta == "a") {
                            questoes_certas.add(contadorQuestoes);
                          } else {
                            questoes_erradas.add(contadorQuestoes);
                          }
                        }
                        if (_value2) {
                          if (questoes[contadorQuestoes].questao_correta == "b") {
                            questoes_certas.add(contadorQuestoes);
                          } else {
                            questoes_erradas.add(contadorQuestoes);
                          }
                        }
                        if (_value3) {
                          if (questoes[contadorQuestoes].questao_correta == "c") {
                            questoes_certas.add(contadorQuestoes);
                          } else {
                            questoes_erradas.add(contadorQuestoes);
                          }
                        }
                        if (_value4) {
                          if (questoes[contadorQuestoes].questao_correta == "d") {
                            questoes_certas.add(contadorQuestoes);
                          } else {
                            questoes_erradas.add(contadorQuestoes);
                          }
                        }
                        if (contadorQuestoes == 4) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Resultado(this.questoes_certas, this.questoes_erradas, widget.jsonDisciplina)),
                          );
                        } else {
                          contadorQuestoes++;
                          _value1 = false;
                          _value2 = false;
                          _value3 = false;
                          _value4 = false;
                          setState(() {});
                        }
                    },
                    child: Container(
                      width: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Proxima"),
                          Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    )
                ),
              ],
            )
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
