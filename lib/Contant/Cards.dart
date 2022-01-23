// ignore_for_file: deprecated_member_use, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(
          bottom: 10,
        ),
        color: Colors.white,
        constraints: BoxConstraints(
            minHeight: 100, minWidth: double.infinity, maxHeight: 130),
        child: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.30,
              decoration: BoxDecoration(
                color: Colors.yellow,
                image: DecorationImage(
                  image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4PdHtXka2-bDDww6Nuect3Mt9IwpE4v4HNw&usqp=CAU',
                  ),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(
                  top: 10,
                  left: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width * 95,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
