// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:twinku/Comon/ShowDialog.dart';
import 'package:twinku/Comon/Showdialog_Delete.dart';

class Details extends StatelessWidget {
  Future<void> Features(BuildContext context) async {
    final confirmation = await Showdialog(
      context,
      CancelactionText: "Edit Post",
      DefaultActionText: " Delete Post",
    );
    if (confirmation == true) {
      // await _singInOut(context);
    }
  }

  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.70,
          margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey, // red as border color
            ),
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                suffixIcon: Container(
                  child: InkWell(
                    child: Icon(
                      Icons.compass_calibration_rounded,
                      color: Colors.blue,
                      size: 20,
                    ),
                  ),
                ),
                border: InputBorder.none,
                hintText: "Write a comments",
                hintStyle: TextStyle(color: Colors.grey[500]),
              ),
              autofillHints: [AutofillHints.email],
              validator: (email) =>
                  email == null ? 'Enter a valid Email' : null,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
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
                          onTap: () {},
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.black,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Details",
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
                          onTap: () => Features(context),
                          child: Icon(
                            Icons.more_horiz,
                            color: Colors.black,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
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
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU'),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Twinku raises \$ 4.2m seed for Africa-wide expansion",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.thumb_up,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "2.2k",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.change_circle_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "2.3k",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.calendar_today,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "12 jan 2021",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      child: CircleAvatar(
                        radius: 20,
                        child: ClipRRect(
                          child: Image.asset("images/wavinghand.png"),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    Text(
                      "johns stone",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                /*  TextFormField(
                  minLines:
                      6, // any number you need (It works as the rows for the textarea)
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ), */
                Text(
                  "Twinku raises \$ 4.2m seed for Africa-wide expansion",
                  maxLines: 500,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
