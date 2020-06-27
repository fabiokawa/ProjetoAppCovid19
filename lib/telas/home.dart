import 'package:flutter/material.dart';
import 'package:projetocovid19app/telas/mortes_tela.dart';
import 'package:projetocovid19app/telas/casos_tela.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19 no Brasil',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(title: 'COVID-19 no Brasil'),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 no Brasil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.topCenter,
              width: 280,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(),
              ),
              child: Text("Evolução dos casos de COVID-19 no Brasil\n",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CasosTela()),
                );
              },
              color: Colors.green,
              textColor: Colors.white,
              child: Text ('Clique aqui'),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.topCenter,
              width: 280,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                border: Border.all(),
              ),
              child: Text("Evolução das mortes por COVID-19 no Brasil\n",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
            RaisedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MortesTela()),
                );
              },
              color: Colors.redAccent,
              textColor: Colors.white,
              child: Text ('Clique aqui'),
            ),
          ],
        ),
      ),
    );
  }
}
