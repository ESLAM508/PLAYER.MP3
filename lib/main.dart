import 'package:flutter/material.dart';
import 'package:flutter_application_1/Home_page.dart';
import 'package:flutter_application_1/models/playlist_provider.dart';
import 'package:flutter_application_1/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
     MultiProvider(providers: [ 
   ChangeNotifierProvider( create: (context) => ThemeProvider()),
   ChangeNotifierProvider( create: (context) => PlayListProvider()),
   ],  child:const Player() ),
  );
}

class Player extends StatelessWidget {
  const Player({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
