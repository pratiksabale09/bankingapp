import 'package:bankingapp/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  //WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  
  );
  runApp(const MyApp());
  //flutter run -d chrome --web-hostname localhost --web-port 5000
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Transfer',
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
        primarySwatch: Colors.pink,
        backgroundColor: Colors.pink,
        accentColor: Colors.deepPurple,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.pink,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )
        ),
      ),
      home:  AuthScreen(),
      );
  }
}

// class StateFulApp extends StatefulWidget {
//   @override
//   _StateFulAppState createState() => _StateFulAppState();
// }

// class _StateFulAppState extends State<StateFulApp> {
//   Future getUserInfo() async {
  
//   }
//   @override
//   Widget build(BuildContext context) {
//     return AuthDialog();
//   }
// }
