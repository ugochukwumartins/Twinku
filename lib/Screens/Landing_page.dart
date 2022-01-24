// ignore: file_names

// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:twinku/Screens/Bottomnava.dart';
import 'package:twinku/Screens/LogIn_Page.dart';
import 'package:twinku/Services/Auth_user.dart';
import 'package:twinku/Services/database.dart';

import 'Home.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return StreamBuilder<User?>(
      stream: auth.authchanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? users = snapshot.data;
          if (users == null) {
            return LoginIn();
          } else {
            return Provider<Database>(
              create: (_) => FirestoreDataBase(Uid: users.uid),
              child: ButtomBar(),
            );
          }
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
