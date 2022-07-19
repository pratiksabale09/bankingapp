import 'package:bankingapp/widgets/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;

  void _submitAuthForm(
    String email, String password, String username, bool islogin) async {
    UserCredential userCredential;

    try
    {
        if (islogin) {
      userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } else {
      userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    }
    print(userCredential);
    } on PlatformException catch (err)
    {
      var message = 'An error occured please check message';
      if(err.message!=null)
      {
        message = err.message!;
      }
      
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: Theme.of(context).errorColor,),);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm),
    );
  }
}
