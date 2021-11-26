import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Mod Calculator '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Input {
  int data = 0;
}

class _MyHomePageState extends State<MyHomePage> {
  int _uInput = 0;
  int _baseInput = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: Text(
                _baseInput > 0
                    ? (_uInput % _baseInput).toString()
                    : 0.toString(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: (width - 50) / 3,
                    child: TextFormField(
                      onChanged: (inp) {
                        int? userInput = int.parse(inp);

                        if (userInput == 1) return;
                        setState(() {
                          _uInput = userInput;
                        });
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    width: 50,
                    child: Text('mod'),
                  ),
                  Container(
                      width: (width - 50) / 3,
                      child: TextFormField(
                        onChanged: (inp) {
                          int? userInput = int.parse(inp);

                          if (userInput == 1) return;
                          setState(() {
                            _baseInput = userInput;
                          });
                        },
                        keyboardType: TextInputType.number,
                      ))
                ])
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
