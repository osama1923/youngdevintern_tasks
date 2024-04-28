import 'package:flutter/material.dart';

  class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State
  {
String _output = '0';
String _calculation = '';
double num1 = 0.0;
double num2 = 0.0;
String operand = '';

void _buttonPressed(String buttonText) {
setState(() {
if (buttonText == 'C') {
_output = '0';
_calculation = '';
num1 = 0.0;
num2 = 0.0;
operand = '';
} else if (buttonText == '+' || buttonText == '-' || buttonText == 'x' || buttonText == '/') {
num1 = double.parse(_output);
operand = buttonText;
_calculation += ' $_output $operand';
_output = '0';
} else if (buttonText == '=') {
num2 = double.parse(_output);
_calculation += ' $_output =';
if (operand == '+') {
_output = (num1 + num2).toString();
}
if (operand == '-') {
_output = (num1 - num2).toString();
}
if (operand == 'x') {
_output = (num1 * num2).toString();
}
if (operand == '/') {
_output = (num1 / num2).toString();
}
num1 = 0.0;
num2 = 0.0;
operand = '';
} else {
if (_output == '0' && buttonText != '.') {
_output = buttonText;
} else if (buttonText == '.' && !_output.contains('.')) {
_output += buttonText;
} else if (buttonText != '.') {
_output += buttonText;
}
}
});
}

Widget buildButton(String buttonText) {
return Expanded(
child: Padding(
padding: const EdgeInsets.all(4.0),
child: ElevatedButton(
onPressed: () {
_buttonPressed(buttonText);
},
child: Text(
buttonText,
style: TextStyle(fontSize: 20.0),
),
),
),
);
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
  backgroundColor: Color.fromARGB(196, 2, 90, 8),
title: Text('Calculator' , style: TextStyle(color: Color.fromRGBO(249, 250, 250, 0.893)),),
centerTitle: true,
),
backgroundColor: Color.fromARGB(255, 237, 237, 237),
body: Column(
children: [
Expanded(
child: Container(
alignment: Alignment.bottomRight,
padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.end,
mainAxisAlignment: MainAxisAlignment.end,
children: [
Text(
_calculation,
style: TextStyle(fontSize: 20.0, color: Colors.grey),
),
Text(
_output,
style: TextStyle(fontSize: 48.0),
),
],
),
),
),
Expanded(
flex: 2,
child: Column(
children: [
Expanded(
child: Row(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
buildButton('7'),
buildButton('8'),
buildButton('9'),
buildButton('/'),
],
),
),
Expanded(
child: Row(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
buildButton('4'),
buildButton('5'),
buildButton('6'),
buildButton('x'),
],
),
),
Expanded(
child: Row(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
buildButton('1'),
buildButton('2'),
buildButton('3'),
buildButton('-'),
],
),
),
Expanded(
child: Row(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
buildButton('.'),
buildButton('0'),
buildButton('C'),
buildButton('+'),
],
),
),
Expanded(
child: Row(
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
buildButton('='),
],
),
),
],
),
),
],
 ),
);
}
}