import 'package:calculadora/buttons.dart';
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
  final List<String> buttons = ['C','+/-','%','/','9','8','7','x','6','5','4','-','3','2','1','+','0','',',','='];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Expanded(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text('2345678', style:TextStyle(fontSize: 40)),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return showButton(buttons[index], Colors.green, Colors.white, unique: true);
                    } else if (index == 1) {
                      return showButton(buttons[index], Colors.red, Colors.white, unique: true);
                    } else {
                      return showButton(buttons[index], Colors.deepOrange, Colors.deepOrange);
                    }
                  })),
        )
      ]),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') return true;
    return false;
  }

  Widget showButton(String buttonText, Color color, Color textColor,{bool unique = false}) {
    return Buttons(
      buttonText: buttonText,
      color: 
        unique
          ? color
          : isOperator(buttonText) 
            ? color 
            : Colors.deepOrange[50],
      textColor:
        unique 
          ? textColor 
          : isOperator(buttonText) 
            ? Colors.white 
            : textColor,
    );
  }
}
