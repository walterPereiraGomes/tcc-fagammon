import 'package:flutter/material.dart';
import 'RedesDeComputadores.dart';
import 'package:flutter_app/MercadoDeCapitais.dart';
import 'package:flutter_app/SegurancaDaInformacao.dart';
import 'DesenvolvimentoMobile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
              Text("Selecione a disciplina:"),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
                          MaterialPageRoute(builder: (context) => RedesDeComputadores()),
                        );
                      },
                      child: Container(
                        width: 165,
                        child: Column(
                          children: [
                            Icon(Icons.computer),
                            Text("Redes de computadores"),
                          ],
                        ),
                      )
                  ),
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
                          MaterialPageRoute(builder: (context) => SegurancaDaInformacao()),
                        );
                      },
                      child: Container(
                        width: 165,
                        child: Column(
                          children: [
                            Icon(Icons.security),
                            Text("Segurança da informação"),
                          ],
                        ),
                      )
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
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
                          MaterialPageRoute(builder: (context) => DesenvolvimentoMobile()),
                        );
                      },
                      child: Container(
                        width: 165,
                        child: Column(
                          children: [
                            Icon(Icons.adb),
                            Text("Desenvolvimento Mobile"),
                          ],
                        ),
                      )
                  ),
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
                          MaterialPageRoute(builder: (context) => MercadoDeCapitais()),
                        );
                      },
                      child: Container(
                        width: 165,
                        child: Column(
                          children: [
                            Icon(Icons.attach_money),
                            Text("Mercado de Capitais"),
                          ],
                        ),
                      )
                  ),
                ],
              ),
            ]
        )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
