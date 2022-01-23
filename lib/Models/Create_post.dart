import 'package:flutter/material.dart';

class CreatePost {
  CreatePost({required this.Title, required this.Body, required this.id});
  final String Title;
  final String id;
  final String Body;
  factory CreatePost.fromMap(Map<String, dynamic> data, String id) {
    final String name = data['name'];
    final String Body = data['Body'];
    return CreatePost(
      Title: name,
      Body: Body,
      id: id,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': Title,
      'Body': Body,
    };
  }
}
