import 'package:first/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './modCalculator.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modder'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: ListTile(
                  title: Text('Dark Mode'),
                  trailing: StatefulBuilder(
                    builder: (context, StateSetter setState) {
                      return Switch(
                        value: context.read<ThemeProvider>().isDarkMode,
                        // value: Provider.of<ThemeProvider>(context).isDarkMode,
                        onChanged: (value) {
                          context.read<ThemeProvider>().toggle(value);
                          // Provider.of<ThemeProvider>(context, listen: false)
                          //     .toggle(value);
                          setState(() {});
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: ModCalculator(),
    );
  }
}
