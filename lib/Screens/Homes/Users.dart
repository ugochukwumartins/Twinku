// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twinku/Comon/Avatar.dart';
import 'package:twinku/Comon/ShowDialog.dart';
import 'package:twinku/Comon/Showdialog_Delete.dart';
import 'package:twinku/Services/Auth_user.dart';

class AccounPage extends StatelessWidget {
  Future<void> _singInOut(BuildContext context) async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    await auth.signOut();
    Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
  }

  Future<void> ConfirmsingInOut(BuildContext context) async {
    final confirmation = await Delete(
      context,
      content: "Are You Sure You want To Logout",
      CancelactionText: "Cancel",
      DefaultActionText: "LogOut",
    );
    if (confirmation == true) {
      await _singInOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
        actions: <Widget>[
          FlatButton(
              child: Text(
                "logOut",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              onPressed: () => ConfirmsingInOut(context)),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(130),
          child: _buildUserInfo(auth.currentUser),
        ),
      ),
    );
  }

  Widget _buildUserInfo(User? user) {
    return Column(
      children: [
        Avatar(
          PhotoUrl: user!.photoURL,
          radius: 50,
        ),
        SizedBox(
          height: 8,
        ),
        if (user.displayName != null)
          Text(
            user.displayName!,
            style: TextStyle(color: Colors.white),
          ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}
