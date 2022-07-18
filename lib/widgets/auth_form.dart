import 'package:bankingapp/screens/google_signin.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn);

  final void Function(
      String email, String password, String username, bool islogin) submitFn;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  var _isLogin = true;
  var _useremail = '';
  var _userpass = '';
  var _username = '';
  void _trySubmit() {
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formkey.currentState!.save();
      // print(_username);
      // print(_useremail);
      // print(_userpass);
      //send to firebase
      widget.submitFn(_useremail, _userpass, _username, _isLogin);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
     child: Column(
       children: <Widget>[
        Card(
      margin: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //email
                TextFormField(
                  key: ValueKey('email'),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _useremail = value!;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                  ),
                ),
                if (!_isLogin)
                  TextFormField(
                    key: ValueKey('username'),
                    validator: (value) {
                      if (value!.length < 8) {
                        return 'username too short';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _username = value!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                TextFormField(
                  key: ValueKey('password'),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 7) {
                      return 'Password must be atleast 7 characters long';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _userpass = value!;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 12),
                // ignore: deprecated_member_use
                RaisedButton(
                  child: Text(_isLogin ? 'Login' : 'Signup'),
                  onPressed: _trySubmit,
                ),
                // ignore: deprecated_member_use
                SizedBox(height: 5),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    setState(() {
                      _isLogin = !_isLogin;
                    });
                  },
                  child: Text(_isLogin
                      ? 'Create New Account'
                      : 'I already have an account'),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
    SignInDemo(),
     ],)
       );
  }
}
