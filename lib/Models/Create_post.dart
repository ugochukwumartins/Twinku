import 'package:flutter/material.dart';

class CreatePost {
  CreatePost(
      {required this.Title,
      required this.Body,
      required this.id,
      required this.Urls});
  final String Title;
  final String id;
  final String Body;
  final String Urls;
  factory CreatePost.fromMap(Map<String, dynamic> data, String id) {
    final String name = data['name'];
    final String Body = data['Body'];
    final String Urls = data['url'];
    return CreatePost(
      Title: name,
      Body: Body,
      id: id,
      Urls: Urls,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': Title,
      'Body': Body,
      'url': Urls,
    };
  }
}
