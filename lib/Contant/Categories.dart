// ignore_for_file: file_Textcategoriess, file_names, avoid_print, prefer_const_constructors
import 'package:flutter/material.dart';

List<String> categories = ["Facinators", "Foods", "Others"];

class Textcategories extends StatefulWidget {
  Textcategories({Key? key, required this.index});
  final int index;

  @override
  _TextcategoriesState createState() => _TextcategoriesState();
}

class _TextcategoriesState extends State<Textcategories> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = widget.index;
          print(widget.index);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: selectedItem == widget.index
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
            Text(
              categories[widget.index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: selectedItem == widget.index
                    ? Colors.black
                    : Colors.black12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
