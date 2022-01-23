// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, sized_box_for_whitespace, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:twinku/Contant/Cards.dart';
import 'package:twinku/Contant/Categories.dart';
import 'package:twinku/Widget/brakingnews.dart';

class HomePage extends StatefulWidget {
  List<String> categories = [
    "All",
    "Information",
    "Media",
    "Sports",
    "Business",
    "Culture"
  ];
  int selectedItem = 0;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: false,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            "Hello Sonia",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            height: 30,
                            child: Image.asset("images/wavinghand.png"),
                          ),
                        ],
                      ),
                      Container(
                        height: 45,
                        child: CircleAvatar(
                          radius: 60,
                          child: ClipRRect(
                            child: Image.asset("images/wavinghand.png"),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.70,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
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
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              border: InputBorder.none,
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.grey[500]),
                            ),
                            autofillHints: [AutofillHints.email],
                            validator: (email) =>
                                email == null ? 'Enter a valid Email' : null,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 29.0),
                        child: Container(
                          color: Colors.blue,
                          child: InkWell(
                            child: Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Breaking news",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    child: ListView.builder(
                      itemBuilder: (context, index) => BreakingNews(),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: SizedBox(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.categories.length,
                        itemBuilder: (context, index) => Textcategories(index),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) => Cards(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget Textcategories(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selectedItem = index;
          print(index);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: widget.selectedItem == index
                    ? Colors.blue
                    : Colors.transparent,
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
              height: 8,
            ),
            Text(
              widget.categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color:
                    widget.selectedItem == index ? Colors.blue : Colors.black12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
