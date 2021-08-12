import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(title: "Contador de Pessoas", home: Home()),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<Home> {

  int _people = 0;
  String _infoText = "Pode entrar!";

  void _changePeople(int delta){
    setState(() {
      _people += delta;

      if(_people < 0){
        _infoText = "Espírito?";
      } else if (_people <=10){
        _infoText = "Pode entrar!";
      } else {
        _infoText = "Lotado";
      }

    });
  }

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_people",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsetsDirectional.all(10.0),
                    child: TextButton(
                        child: Text("+1",
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                            )),
                        onPressed: () {
                          _changePeople(1);
                        })),
                Padding(
                    padding: EdgeInsetsDirectional.all(10.0),
                    child: TextButton(
                        child: Text("-1",
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                            )),
                        onPressed: () {
                          _changePeople(-1);
                        })),
              ],
            ),
            Text(_infoText,
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0,
                ))
          ],
        ),
      ],
    );
  }
}
