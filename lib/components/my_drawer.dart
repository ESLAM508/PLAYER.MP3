import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //logo
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.music_note,
                size: 50,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

       //   home title
           Padding(
             padding: const EdgeInsets.only(left: 10),
             child: ListTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home), 
              onTap: ()  => Navigator.pop(context),
             

              ),
              ),
           

          //setting title


           Padding(
             padding: const EdgeInsets.only(left: 10 , right: 10),
             child: ListTile(
              title: const Text('settings'),
              leading:const Icon(Icons.settings),
               onTap: () { Navigator.pop(context); 

              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingPage(), ),);
              },


              ),
              ),
        ],
      ),
    );
  }
}
