import 'package:flutter/material.dart';
import 'Detalhes.dart';
import 'RedesDeComputadores.dart';

void main(List<int> a, List<int> b, String json) {
  runApp(Resultado(a, b, json));
}

class Resultado extends StatelessWidget {
  final List<int> questoes_corretas;
  final List<int> questoes_erradas;
  final String jsonDisciplina;

  Resultado(this.questoes_corretas, this.questoes_erradas, this.jsonDisciplina);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Seu resultado final foi:"),
            Text(((widget.questoes_corretas.length * 100) / (widget.questoes_corretas.length + widget.questoes_erradas.length)).toInt().toString() + "%",
              style: TextStyle(fontSize: 60.0),),
            FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.greenAccent,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Detalhes(widget.questoes_corretas, widget.questoes_erradas, widget.jsonDisciplina)),
                  );
                },
                child: Container(
                  width: 200,
                  child: Column(
                    children: [
                      Text("Ver Detalhes",
                        style: TextStyle(fontSize: 20.0),),
                    ],
                  ),
                )
            ),
          ],
        ),
        )
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
