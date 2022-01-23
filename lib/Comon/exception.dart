import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:twinku/Comon/Showdialog_Delete.dart';

import 'Showdialog.dart';

Future<void> Showexception(
  BuildContext context, {
  required String title,
  required Exception exception,
}) =>
    Delete(
      context,
      content: exceptionMessage(exception),
      CancelactionText: "",
      DefaultActionText: "Ok",
    );

String? exceptionMessage(Exception exception) {
  if (exception is FirebaseException) {
    return exception.message;
  } else {
    return exception.toString();
  }
}
