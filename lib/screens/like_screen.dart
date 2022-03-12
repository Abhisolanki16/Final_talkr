

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talkr_demo/widgets/theme_model.dart';

class LikeScreen extends StatefulWidget {

  @override
  _LikeScreenState createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        
      //backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Like Page",
        ),
       // backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
             themeNotifier.isDark ? "Dark Theme" : "Light Theme"
            ),

            Center(
              child:
              Switch(
                value: themeNotifier.isDark ? false : true, 
                onChanged: (bool value) { 
                  themeNotifier.isDark ? themeNotifier.isDark = false : themeNotifier.isDark = true;
                 }
              ),          
            ),
            Text("welcome",)
          ],
        ),
      ),
    );
    },);
    
  }
}
