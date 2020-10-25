import 'package:flutter/material.dart';
import 'Questao.dart';
import 'dart:convert' show json;
import 'main.dart';

void main(List<int> a, List<int> b, String json) {
  runApp(Detalhes(a, b, json));
}

class Detalhes extends StatelessWidget {
  final List<int> questoes_corretas;
  final List<int> questoes_erradas;
  final String jsonDisciplina;

  Detalhes(this.questoes_corretas, this.questoes_erradas, this.jsonDisciplina);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Fagammon', questoes_corretas: questoes_corretas, questoes_erradas: questoes_erradas, jsonDisciplina: jsonDisciplina),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.questoes_corretas, this.questoes_erradas, this.jsonDisciplina}) : super(key: key);

  final String title;
  final List<int> questoes_corretas;
  final List<int> questoes_erradas;
  final String jsonDisciplina;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Questao> questoes;
  Questao questao;

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
    for(var i = 0; i<5; i++) {
      questao = Questao.fromJson(json.decode(data)[i]);
      listaAux.add(questao);
    }
    questoes = listaAux;
    setState(() {});
  }

  Widget getQuestoesErradasComJustificativas()
  {
    List<Widget> list = new List<Widget>();
    if (questoes != null) {
      widget.questoes_erradas.forEach((index) {
        list.add(
          new Container(
           child: Column(
             children: [
               Text(questoes[index].pergunta),
               Text("Justificativa: " + questoes[index].justificativa),
               Text("=============================")
             ],
           ),
          )
        );
      });
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Questões erradas:"),
            getQuestoesErradasComJustificativas()
          ],
        ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        },
        child: Icon(Icons.keyboard_backspace),
        backgroundColor: Colors.green,
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
