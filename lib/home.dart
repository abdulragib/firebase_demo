import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance
                    .signOut()
                    .then((value) {
                      Navigator.pop(context);
                })
                    .catchError((e) {
                  print(e);
                });
              },
              child: Text("logout"),
            )
          ],
        ),
      ),
    );
  }
}
