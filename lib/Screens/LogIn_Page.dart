// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names, use_key_in_widget_constructors, unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twinku/Comon/exception.dart';
import 'dart:convert';

import 'package:twinku/Services/Auth_user.dart';

class LoginIn extends StatefulWidget {
  @override
  _LoginInState createState() => _LoginInState();
}

class _LoginInState extends State<LoginIn> {
  bool? value = false;
  bool visible = false;
  final _Email = TextEditingController();

  final _Password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _Email.dispose();
    _Password.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  String get _email => _Email.text;

  String get _password => _Password.text;

  void onListen() => setState(() {});
  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  //
  Future<void> _signIn() async {
    final auth = Provider.of<AuthBase>(context, listen: false);
    // setState(() {
    //   submitted = true;
    //   _isLoading = true;
    // });
    try {
      if (_validateAndSave()) {
        await auth.singinWithEmail(_email, _password);
      }
      Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      Showexception(
        context,
        title: 'Sing in Failed',
        exception: e,
      );
    } finally {
      // setState(() {
      //_isLoading = false;
      // });
    }
  }

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: _formBody(context),
        ),
      ),
    );
  }

  Widget _formBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 0, bottom: 0),
        width: double.infinity,
        padding: EdgeInsets.only(left: 20, right: 20),
        height: size.height * 98,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 230.0),
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 120,
                ),
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.black, // red as border color
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: _Email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.mail),
                            border: InputBorder.none,
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey[500]),
                          ),
                          autofillHints: [AutofillHints.email],
                          validator: (email) =>
                              email == null ? 'Enter a valid Email' : null,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black, // red as border color
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: _Password,
                          obscureText: visible ? false : true,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    visible = !visible;
                                  });
                                },
                                child: visible
                                    ? Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.grey,
                                      )
                                    : Icon(
                                        Icons.visibility_off,
                                        color: Colors.grey,
                                      )),
                            border: InputBorder.none,
                            hintText: "password",
                            hintStyle: TextStyle(color: Colors.grey[500]),
                          ),
                          validator: (value) =>
                              value!.isNotEmpty ? null : 'Cant be Empty',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: value,
                                onChanged: (isChecked) {
                                  setState(
                                    () {
                                      value = isChecked;
                                    },
                                  );
                                },
                              ),
                              Text(
                                "Remember me",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "Forgot password",
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 10, 0, 4),
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: MaterialButton(
                        onPressed: () => _signIn(),
                        child: Text(
                          'Log In',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 80.0,
                        top: 30,
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 10,
                              minHeight: 10,
                            ),
                            child: Container(
                              width: 1,
                              height: 1,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text("Or log in with"),
                          SizedBox(
                            width: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 10,
                              minHeight: 10,
                            ),
                            child: Container(
                              width: 1,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 130.0,
                        top: 30,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 30,
                            child: Image.asset("images/apple.png"),
                          ),
                          Container(
                            height: 30,
                            child: Image.asset("images/google.png"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
