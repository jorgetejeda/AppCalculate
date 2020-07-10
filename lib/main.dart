import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  double num2 = 0.0;
  String operand = "";

  void buttonPress(String buttonText) {
    if (buttonText == 'Clear') {
      clearOperation();
    } else if (buttonText == 'x' ||
        buttonText == '/' ||
        buttonText == '+' ||
        buttonText == '-') {
      getOperation(buttonText);
    } else if (buttonText == ".") {
      addingDecimal(buttonText);
    } else if (buttonText == "=") {
      result();
    } else {
      addingNumber(buttonText);
    }
  }

  void clearOperation() {
    setState(() {
      output = "0";
      _output = "";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    });
  }

  void getOperation(String buttonText) {
    num1 = double.parse(output);
    operand = buttonText;
    print(num1.toString() + operand);
    _output = '0';
  }

  void addingDecimal(String buttonText) {
    if (_output.contains(".")) {
      print('Ya has agregado un decimal');
      return;
    } else {
      _output = _output + buttonText;
    }
  }

  void addingNumber(String buttonText) {
    _output = _output + buttonText;
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
    print('valor ' + output);
  }

  void result() {
    num2 = double.parse(output);
    if (operand == "+") _output = (num1 + num2).toString();
    if (operand == "-") _output = (num1 - num2).toString();
    if (operand == "x") _output = (num1 * num2).toString();
    if (operand == "/") _output = (num1 / num2).toString();

    num1 = 0.0;
    num2 = 0.0;
    operand = "";
  }

  Widget buildButton(String text) {
    return Expanded(
        child: MaterialButton(
      padding: EdgeInsets.all(20),
      onPressed: () => buttonPress(text),
      child: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      color: Colors.deepOrange,
      textColor: Colors.white,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: Text(
            output,
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                buildButton('7'),
                buildButton('8'),
                buildButton('9'),
                buildButton('/'),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('4'),
                buildButton('5'),
                buildButton('6'),
                buildButton('x'),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('1'),
                buildButton('2'),
                buildButton('3'),
                buildButton('-'),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('.'),
                buildButton('0'),
                buildButton(''),
                buildButton('+'),
              ],
            ),
            Row(
              children: <Widget>[
                buildButton('Clear'),
                buildButton('='),
              ],
            ),
          ],
        )
      ]),
    );
  }
}
