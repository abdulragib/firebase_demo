import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'constant.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  var _email;
  var password;
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
                style: const TextStyle(color: Colors.black),
                decoration: kInputTextFieldEmail,
                onChanged: (value) {
                  setState(
                    () {
                      _email = value;
                    },
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              style: const TextStyle(color: Colors.black),
              decoration: kInputTextFieldPassword,
              onChanged: (value) {
                setState(
                  () {
                    password = value;
                  },
                );
              },
              obscureText: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: (){
              _auth.createUserWithEmailAndPassword(
                  email: _email, password: password)
                  .then((signedInUser){
                _firestore.collection('users')
                    .add({'email' : _email, 'password' : password,})
                    .then((value){
                  if (signedInUser!= null){
                    Navigator.pushNamed(context, '/home');
                  }
                })
                    .catchError((e){
                  print(e);
                })
                ;}
              )
                  .catchError((e){
                print(e);
              });
            },
            child: const Text("Sign up"),
          ),
        ],
      )),
    );
  }
}
