import 'package:flutter/material.dart';
import 'model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Temperature Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Temperature Converter'),
      debugShowCheckedModeBanner: false,
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
  Model _m = Model();
  String _textTemp = "Enter a temp";
  bool _isSwitched = true;
  void _updateTemp() {
    setState(() {
      _textTemp = _m.convertS();
    });
  }

  void _updateSwitch(bool value) {
    setState(() {
      _isSwitched = value;
      _m.toggle();
      _textTemp = _m.convertS();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _textTemp,
              style: TextStyle(fontSize: 30),
            ),
            Container(
              child: TextField(
                style: TextStyle(fontSize: 30),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input Temp',
                ),
                onChanged: (text) {
                  _m.setTemp((double.tryParse(text) ?? -500.0));
                  _updateTemp();
                },
              ),
              padding: EdgeInsets.all(50),
              width: 400,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Text(
                '°C',
                style: TextStyle(fontSize: 25),
              ),
              Switch(
                value: _isSwitched,
                onChanged: (value) {
                  _updateSwitch(value);
                },
              ),
              Text(
                '°F',
                style: TextStyle(fontSize: 25),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
