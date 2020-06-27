import 'package:flutter/material.dart';
import 'package:projetocovid19app/telas/home.dart';
import 'package:projetocovid19app/model/casos.dart';
import 'package:projetocovid19app/utilities/network_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

void main() => runApp(CasosTela());

class CasosTela extends StatefulWidget {
  @override
  _CasosTelaState createState() => _CasosTelaState();
}

class _CasosTelaState extends State<CasosTela> {

  var _dadosRecebidos1c = "";
  var _dadosRecebidos1d = "";
  var _dadosRecebidos2c = "";
  var _dadosRecebidos2d = "";

  @override
  Widget build(BuildContext context) {
    return _constroiCasosTela();
  }

  Widget _constroiCasosTela() {
    return Scaffold(
      appBar: _constroiCasosTelaAppBar(),
      body: _constroiCasosTelaBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          var helper = NetworkHelper(url: "https://api.covid19api.com/country/brazil/status/confirmed?from=2020-06-01T00:00:00Z&to=2020-06-26T00:00:00Z");
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

  _constroiCasosTelaAppBar() {
    return AppBar(
      title: Text("Casos de COVID-19"),
    );
  }

  _constroiCasosTelaBody() {
    var data = [526447.0, 555383.0, 584016.0, 614941.0, 614941.0, 672846.0, 691758.0, 707412.0, 739503.0, 772416.0, 802828.0, 828810.0, 850514.0, 867624.0,
      888271.0, 923189.0, 955377.0, 978142.0, 1032913.0, 1032913.0, 1083341.0, 1106470.0, 1145906.0, 1188631.0, 1228114.0];
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(30.0),
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.topCenter,
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.green,
            border: Border.all(),
          ),
          child: Text("Total de Casos:\n"+_dadosRecebidos1c+"\n"+"Data:\n"+_dadosRecebidos1d,
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
            color: Colors.green,
            border: Border.all(),
          ),
          child: Text("Total de Casos:\n"+_dadosRecebidos2c+"\n"+"Data:\n"+_dadosRecebidos2d,
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
                colors: [Colors.green[800], Colors.green[200]],
              ),
            ),
          ),
        ),
      ],
    );
  }
}