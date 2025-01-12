import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = '';
  String result = '';

  void onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == '=') {
        try {
          result = evaluateExpression(input);
        } catch (e) {
          result = 'Error';
        }
        input = '';
      } else if (buttonText == 'C') {
        input = '';
        result = '';
      } else {
        input += buttonText;
      }
    });
  }

  String evaluateExpression(String expression) {
    Parser p = Parser();
    Expression exp = p.parse(expression);
    ContextModel cm = ContextModel();
    num eval = exp.evaluate(EvaluationType.REAL, cm);

    int roundResult = eval.round();
    return roundResult.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              input,
              style: const TextStyle(fontSize: 24),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerRight,
            child: Text(
              result,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('/')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('*')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('C'),
              buildButton('0'),
              buildButton('='),
              buildButton('+')
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton(String buttonText) {
    return ElevatedButton(
      onPressed: () => onButtonPressed(buttonText),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}