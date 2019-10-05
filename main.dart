import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Calculator'),
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
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 =0.0;
  String operand = "";

  buttonpressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 0.0;
      num2 =0.0;
      operand = "";
    }
    else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/" || buttonText == "pow" || buttonText =="sqt") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    }
    else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Allready contains a decimal");
        return;
      }else{
        _output=_output+buttonText;
      }
    }
    else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      if (operand == "pow") {
        double a = 1;
        for (var i = 0; i < num2; i++) {
          a = a * num1;
        }
        _output = (a).toString();
      }
      if (operand == "sqt") {
        _output = sqrt(num1).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
    else{
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
      
    });
  }

  Widget buildbutton(String txt) {
    return new Expanded(
      child: new MaterialButton(
        padding: EdgeInsets.all(20.0),
        child: new Text(
          txt,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () => buttonpressed(txt),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                  alignment: Alignment.centerRight,
                  padding: new EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 12.0),
                  child: new Text(
                    output,
                    style: new TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              new Expanded(
                child: new Divider(),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      buildbutton("7"),
                      buildbutton("8"),
                      buildbutton("9"),
                      buildbutton("+"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildbutton("4"),
                      buildbutton("5"),
                      buildbutton("6"),
                      buildbutton("-"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildbutton("1"),
                      buildbutton("2"),
                      buildbutton("3"),
                      buildbutton("*"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildbutton("."),
                      buildbutton("0"),
                      buildbutton("00"),
                      buildbutton("/"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      buildbutton("C"),
                      buildbutton("pow"),
                      buildbutton("sqt"),
                      buildbutton("="),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
