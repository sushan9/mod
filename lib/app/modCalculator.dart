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
    return 0.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: Text(
              getMod(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new ModInput(stateUpdater: setUserInput),
              Container(
                width: 50,
                child: Text('mod'),
              ),
              new ModInput(stateUpdater: setBaseInput),
            ],
          ),
        ],
      ),
    );
  }
}
