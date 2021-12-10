import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'constant.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  var _email;
  var password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children:  <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                  style: const TextStyle(color: Colors. black),
                decoration: kInputTextFieldEmail,
                onChanged: (value) {
                  setState(() {
                    _email=value;
                  },);
                }
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                  decoration: kInputTextFieldPassword,
                  onChanged: (value) {
                    setState(() {
                      password=value;
                    },);
                  },
                obscureText: true,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: (){
                FirebaseAuth.instance.signInWithEmailAndPassword(
                  email:_email,
                  password:password
                ).then((FireBaseUser) {
                  Navigator.pushNamed(context, '/home');
                }).catchError((e){
                  print(e);
                });
              }, child: const Text("Sign in"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, '/signup');
              }, child: const Text("Sign up"),
            ),
          ],
        )
      ),
    );
  }
}
