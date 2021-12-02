import 'package:flutter/material.dart';
import './modInput.dart';

class ModCalculator extends StatefulWidget {
  ModCalculator({Key? key}) : super(key: key);

  @override
  _ModCalculatorState createState() => _ModCalculatorState();
}

class _ModCalculatorState extends State<ModCalculator> {
  int _uInput = 0;
  int _baseInput = 0;

  void setUserInput(int input) {
    setState(() {
      _uInput = input;
    });
  }

  void setBaseInput(int input) {
    setState(() {
      _baseInput = input;
    });
  }

  String getMod() {
    if (_baseInput > 0) {
      return (_uInput % _baseInput).toString();
    }
    return '0';
  }

  String getQuotient() {
    if (_baseInput > 0) {
      return (_uInput ~/ _baseInput).toString();
    }
    return '0';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            getMod(),
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(height: 20),
          Text(
            'Quotient = ${getQuotient()}',
            style:
                Theme.of(context).textTheme.headline4!.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ModInput(onKeyUp: setUserInput),
              Text(
                'mod',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 18),
              ),
              ModInput(onKeyUp: setBaseInput),
            ],
          ),
        ],
      ),
    );
  }
}
