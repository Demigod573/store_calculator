import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_awesome_calculator/flutter_awesome_calculator.dart';
import 'package:google_fonts/google_fonts.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 60, 56, 56),
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 80, 79, 79),
        title: Text("Calculator" ,style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 25) ,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlutterAwesomeCalculator(
                  fractionDigits: 0,
                  showAnswerField: true,
                  buttonRadius: 8,
                  height: 530,
                  context: context,
                  clearButtonColor: Color.fromARGB(255, 139, 139, 142),
                  digitsButtonColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 60, 56, 56),
                  expressionAnswerColor: Color.fromARGB(255, 248, 244, 244),
                  onChanged: (answer, expression) {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
