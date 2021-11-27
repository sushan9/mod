import 'package:flutter/material.dart';

class ModInput extends StatelessWidget {
  final stateUpdater;
  const ModInput({ Key? key, this.stateUpdater}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: (width - 50) / 3,
      child: TextFormField(
        onChanged: (inp) {
          int? userInput = int.tryParse(inp);

          if (userInput == null) return;

          stateUpdater(userInput);
        },
        keyboardType: TextInputType.number,
      ),
    );
  }
}
