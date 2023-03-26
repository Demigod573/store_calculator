import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_awesome_calculator/flutter_awesome_calculator.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 12, 7, 7),
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlutterAwesomeCalculator(
            fractionDigits: 0,
            showAnswerField: true,
            buttonRadius: 16,
            height: 500,
            context: context,
            clearButtonColor: Color.fromARGB(255, 103, 74, 248),
            digitsButtonColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 11, 4, 4),
            expressionAnswerColor: Color.fromARGB(255, 248, 244, 244),
            onChanged: (answer, expression) {},
          )
        ],
      ),
    );
  }
}
