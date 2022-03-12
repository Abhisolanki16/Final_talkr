import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:talkr_demo/Services/user_provider.dart';
import 'package:talkr_demo/pages/google_sign_in.dart';
import 'package:talkr_demo/screens/like_screen.dart';
import 'package:talkr_demo/screens/splash_screen.dart';
import 'package:talkr_demo/widgets/theme_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

//official code
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(),),
        ChangeNotifierProvider(create: (_) => GoogleSignInProvider(),),
        ChangeNotifierProvider(create: (_)=> ThemeModel(),
        child: Consumer(builder: (context, value, child) => MaterialApp(
          theme: ThemeModel().isDark ? ThemeData.dark() : ThemeData.light(),
          home: LikeScreen(),

        ),),
        )
      ],
      child: const MaterialApp(
            debugShowCheckedModeBanner: false, home: SplashScreen()));
  
  
}
