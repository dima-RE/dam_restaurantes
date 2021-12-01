import 'package:flutter/material.dart';
import 'package:project_06/pages/home_page.dart';
import 'package:project_06/pages/tabs/chefs_tab.dart';
import 'package:project_06/pages/tabs/restaurantes_tab.dart';
import 'package:project_06/pages/tabs/version_tab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // COLORS
          //brightness: Brightness.dark,
          primarySwatch: Colors.deepPurple,
          // FONTS
          fontFamily: 'Lora',
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 50, fontStyle: FontStyle.italic),
            headline2: TextStyle(
                fontSize: 50,
                fontStyle: FontStyle.italic,
                color: Color(0xff97306c)),
            headline3: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w700, color: Colors.red),
            subtitle1: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            subtitle2: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            bodyText1: TextStyle(fontSize: 20, color: Colors.white),
            bodyText2: TextStyle(fontSize: 17),
          )),
      //home: RootPage(),

      routes: {
        '/': (context) => RootPage(),
        '/Restaurantes': (context) => TabRestaurantes(),
        '/Chefs': (context) => TabChefs(),
        '/Versión': (context) => TabVersion(),
      },
      initialRoute: '/',
    );
  }
}
