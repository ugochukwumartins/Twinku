// ignore: file_names
// ignore: file_names
// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names, deprecated_member_use, file_names

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<dynamic> Delete(
  BuildContext context, {
  required String? content,
  required String CancelactionText,
  required String DefaultActionText,
}) {
  if (!Platform.isIOS) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(content!),
              actions: [
                if (CancelactionText != null)
                  FlatButton(
                    child: Text(CancelactionText),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text(DefaultActionText),
                )
              ],
            ));
  } else {
    return showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              content: Text(content!),
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
