import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar( 
        
        title: const Text(
          'S E T T I N G S ',
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(25)
          ),

          padding:const EdgeInsets.all(16),
          margin:   const EdgeInsets.all(25),
          child: Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Dark Mode' ,style : TextStyle(fontWeight: FontWeight.bold), ),
              

               CupertinoSwitch(
                value: Provider.of<ThemeProvider>(context, listen: false)
                    .isDarkMode,
                // ignore: non_constant_identifier_names
                onChanged: (Value)=>
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme(),
              ),

              // CupertinoSwitch(value: Provider.of<ThemeProvider>(context, listen: false)
              //       .isDarkMode, onChanged: (value) => Provider.of<ThemeProvider>( context ,listen : false).toggleTheme() )
            ],
          )),
    );
  }
}
