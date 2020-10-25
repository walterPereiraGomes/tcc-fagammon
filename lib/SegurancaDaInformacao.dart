import 'package:flutter/material.dart';
import 'package:flutter_app/Disciplina.dart';

void main() {
  runApp(SegurancaDaInformacao());
}

class SegurancaDaInformacao extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Fagammon'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

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
      body: Container(
        width: 500.0,
        padding: EdgeInsets.fromLTRB(8, 50, 8, 0),
        child: Column(
            children: <Widget>[
              Text("Selecione a matéria da disciplina:"),
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
                      MaterialPageRoute(builder: (context) => Disciplina("seguranca_na_internet")),
                    );
                  },
                  child: Container(
                    width: 300,
                    child: Column(
                      children: [
                        Text("Seguranca na Internet",
                        style: TextStyle(fontSize: 20.0),),
                      ],
                    ),
                  )
              ),
//              FlatButton(
//                  color: Colors.green,
//                  textColor: Colors.white,
//                  disabledColor: Colors.grey,
//                  disabledTextColor: Colors.black,
//                  padding: EdgeInsets.all(8.0),
//                  splashColor: Colors.greenAccent,
//                  onPressed: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => Disciplina("taxa_juros")),
//                    );
//                  },
//                  child: Container(
//                    width: 300,
//                    child: Column(
//                      children: [
//                        Text("Taxa de Juros",
//                          style: TextStyle(fontSize: 20.0),),
//                      ],
//                    ),
//                  )
//              ),
//              FlatButton(
//                  color: Colors.green,
//                  textColor: Colors.white,
//                  disabledColor: Colors.grey,
//                  disabledTextColor: Colors.black,
//                  padding: EdgeInsets.all(8.0),
//                  splashColor: Colors.greenAccent,
//                  onPressed: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => Disciplina("mercado_futuro")),
//                    );
//                  },
//                  child: Container(
//                    width: 300,
//                    child: Column(
//                      children: [
//                        Text("Mercado Futuro",
//                          style: TextStyle(fontSize: 20.0),),
//                      ],
//                    ),
//                  )
//              ),
//              FlatButton(
//                  color: Colors.green,
//                  textColor: Colors.white,
//                  disabledColor: Colors.grey,
//                  disabledTextColor: Colors.black,
//                  padding: EdgeInsets.all(8.0),
//                  splashColor: Colors.greenAccent,
//                  onPressed: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => Disciplina("investimentos")),
//                    );
//                  },
//                  child: Container(
//                    width: 300,
//                    child: Column(
//                      children: [
//                        Text("Investimentos",
//                          style: TextStyle(fontSize: 20.0),),
//                      ],
//                    ),
//                  )
//              ),
            ]
        )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
