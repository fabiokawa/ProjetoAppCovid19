import 'package:flutter/material.dart';
import 'package:projetocovid19app/telas/home.dart';
import 'package:projetocovid19app/model/mortes.dart';
import 'package:projetocovid19app/utilities/network_helper.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

void main() => runApp(MortesTela());

class MortesTela extends StatefulWidget {
  @override
  _MortesTelaState createState() => _MortesTelaState();
}

class _MortesTelaState extends State<MortesTela> {

  var _dadosRecebidos1c = "";
  var _dadosRecebidos1d = "";
  var _dadosRecebidos2c = "";
  var _dadosRecebidos2d = "";

  @override
  Widget build(BuildContext context) {
    return _constroiMortesTela();
  }

  Widget _constroiMortesTela() {
    return Scaffold(
      appBar: _constroiMortesTelaAppBar(),
      body: _constroiMortesTelaBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var helper = NetworkHelper(url: "https://api.covid19api.com/country/brazil/status/deaths?from=2020-06-01T00:00:00Z&to=2020-06-26T00:00:00Z");
          var dados = await helper.getData();
          print(dados);
          //_dadosRecebidos = (dados.toList()).toString();
          //_dadosRecebidos2 = (dados[0]).toString();
          _dadosRecebidos1c = (dados[0]['Cases']).toString();
          _dadosRecebidos1d = (dados[0]['Date']).toString();
          _dadosRecebidos2c = (dados[24]['Cases']).toString();
          _dadosRecebidos2d = (dados[24]['Date']).toString();
          // Mortes country = Mortes.fromJson(dados);
          setState(() {
            // _dadosRecebidos = dados.toList();
          });
        },
        child: Icon(Icons.autorenew),
      ),
    );
  }

  _constroiMortesTelaAppBar() {
    return AppBar(
      title: Text("Mortes por COVID-19"),
    );
  }

  _constroiMortesTelaBody() {
    var data = [29937.0, 31199.0, 32548.0, 34021.0, 34021.0, 35930.0, 36455.0, 37134.0, 38406.0, 39680.0, 40919.0, 41828.0, 42720.0, 43332.0, 43959.0,
      45241.0, 46510.0, 47748.0, 48954.0, 49976.0, 50591.0, 51271.0, 52645.0, 54971.0];
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(30.0),
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.topCenter,
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            border: Border.all(),
          ),
          child: Text("Total de Mortes:\n"+_dadosRecebidos1c+"\n"+"Data:\n"+_dadosRecebidos1d,
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(30.0),
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.topCenter,
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.redAccent,
            border: Border.all(),
          ),
          child: Text("Total de Mortes:\n"+_dadosRecebidos2c+"\n"+"Data:\n"+_dadosRecebidos2d,
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
            ),
          ),
        ),
        Center(
          child: Container(
            width: 300.0,
            height: 100.0,
            child: Sparkline(
              data: data,
              fillMode: FillMode.below,
              fillGradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.red[800], Colors.red[200]],
              ),
            ),
          ),
        ),
      ],
    );
  }
}