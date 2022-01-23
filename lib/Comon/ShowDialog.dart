// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names, file_names, deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twinku/Comon/Showdialog_Delete.dart';
import 'package:twinku/Screens/Create_post.dart';
import 'package:twinku/Screens/Edit_post.dart';

Future<void> ConfirmsingInOut(BuildContext context) async {
  final confirmation = await Delete(
    context,
    content: "Are You Sure You want To delete this post?",
    CancelactionText: "Cancel",
    DefaultActionText: "Yes",
  );
  if (confirmation == true) {
    // await _singInOut(context);
  }
}

Future<dynamic> Showdialog(
  BuildContext context, {
  required String CancelactionText,
  required String DefaultActionText,
}) {
  if (!Platform.isIOS) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        insetPadding: EdgeInsets.only(
          bottom: 420,
          left: 60,
        ),
        actions: [
          Container(
            height: 70,
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EditPost()),
                  ),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.edit),
                      SizedBox(
                        width: 10,
                      ),
                      Text(CancelactionText),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                InkWell(
                  onTap: () => ConfirmsingInOut(context),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        DefaultActionText,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /*  if (CancelactionText != null)
                  FlatButton(
                    child: Text(CancelactionText),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(DefaultActionText),
                ) */
        ],
      ),
    );
  } else {
    return showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              actions: [
                if (CancelactionText != null)
                  CupertinoDialogAction(
                    child: Text(CancelactionText),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                CupertinoDialogAction(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(DefaultActionText),
                )
              ],
            ));
  }
}
