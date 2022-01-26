// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:twinku/Comon/exception.dart';
import 'package:twinku/Models/Create_post.dart';
import 'package:twinku/Screens/Landing_page.dart';
import 'package:twinku/Services/database.dart';

class EditPost extends StatefulWidget {
  EditPost({required this.Post, required this.database});
  final CreatePost Post;
  final Database database;

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  // image picker section
  File pickedImag =
      File('/twinku/Image/stock-photo-compact-digital-camera-157570142.jpg');
  void pickimageFromgGallerry() async {
    final picker = ImagePicker();
    final picked = await picker.getImage(source: ImageSource.gallery);
    final file = File(picked!.path.toString());
    setState(() {
      pickedImag = file;
    });
    Navigator.pop(context);
  }

  void pickimageFromgCamera() async {
    final picker = ImagePicker();
    final picked = await picker.getImage(source: ImageSource.camera);
    final file = File(picked!.path.toString());
    setState(() {
      pickedImag = file;
    });
    Navigator.pop(context);
  }

//
  final _Title = TextEditingController();

  final _Body = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _Title.dispose();
    _Body.dispose();

    super.dispose();
  }

  @override
  void initState() {
    if (widget.Post != null) {
      hasvalue = true;
      _Title.text = widget.Post.Title;

      _Body.text = widget.Post.Body;
      Url = widget.Post.Urls;
    }
    super.initState();
  }

  bool hasvalue = false;

  //
  String get _title => _Title.text;

  String get _body => _Body.text;
  String Url = "";
  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

//

//
  //
  @override
  Widget build(BuildContext context) {
    Future<void> Savepost() async {
      try {
        if (_validateAndSave()) {
          final ref = FirebaseStorage.instance
              .ref()
              .child('PostsImages')
              .child(_title + 'jpg');
          await ref.putFile(pickedImag);
          Url = await ref.getDownloadURL();

          final id = widget.Post.id;
          final Post =
              CreatePost(Title: _title, Body: _body, Urls: Url, id: id);

          await widget.database.createpost(Post);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LandingPage(),
            ),
          );
        }
      } on FirebaseAuthException catch (e) {
        Showexception(
          context,
          title: 'Creating failed',
          exception: e,
        );
      } finally {}
    }

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white30, // red as border color
                          ),
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Edit Post",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white30, // red as border color
                          ),
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () => Savepost(),
                            child: Text(
                              "Save",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  hasvalue
                      ? Stack(
                          children: [
                            Container(
                              height: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(Url),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 160,
                              top: 100,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color:
                                        Colors.white30, // red as border color
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        hasvalue = false;
                                      });
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                'Choose option',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: [
                                                    InkWell(
                                                      onTap:
                                                          pickimageFromgCamera,
                                                      splashColor:
                                                          Colors.purpleAccent,
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Icon(
                                                              Icons.camera,
                                                              color: Colors
                                                                  .purpleAccent,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Camera',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap:
                                                          pickimageFromgGallerry,
                                                      splashColor:
                                                          Colors.purpleAccent,
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Icon(
                                                              Icons.image,
                                                              color: Colors
                                                                  .purpleAccent,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Gallery',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });

                                      //
                                    },
                                    child: Icon(
                                      Icons.camera_alt_rounded,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Stack(
                          children: [
                            Container(
                              height: 220,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                image: DecorationImage(
                                  image: FileImage(pickedImag),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 160,
                              top: 100,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color:
                                        Colors.white30, // red as border color
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    30,
                                  ),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      //
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                'Choose option',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: [
                                                    InkWell(
                                                      onTap:
                                                          pickimageFromgCamera,
                                                      splashColor:
                                                          Colors.purpleAccent,
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Icon(
                                                              Icons.camera,
                                                              color: Colors
                                                                  .purpleAccent,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Camera',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap:
                                                          pickimageFromgGallerry,
                                                      splashColor:
                                                          Colors.purpleAccent,
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Icon(
                                                              Icons.image,
                                                              color: Colors
                                                                  .purpleAccent,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Gallery',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          });

                                      //
                                    },
                                    child: Icon(
                                      Icons.camera_alt_rounded,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _Title,
                    minLines: 1,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(hintText: "Title"),
                    maxLines: null,
                    validator: (email) =>
                        email == null ? 'Enter a valid Title' : null,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _Body,
                    minLines: 8,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: "Body",
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                    validator: (email) =>
                        email == null ? 'Cant be empty' : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
