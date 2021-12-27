import 'package:first/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/app.dart';
import 'package:provider/provider.dart';
import 'shared_pref/theme_shared_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // portrait only
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  bool isDark = await ThemeSharedPreference.loadTheme();
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  MyApp(this.isDark);
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(isDark),
        builder: (context, child) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Modder',
            debugShowCheckedModeBanner: false,
            themeMode:
                themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: MyThemes.light,
            darkTheme: MyThemes.dark,
            home: App(),
          );
        });
  }
}
