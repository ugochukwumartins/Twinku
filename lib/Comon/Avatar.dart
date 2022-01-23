import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  Avatar({this.PhotoUrl, required this.radius});
  final String? PhotoUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          style: BorderStyle.solid,
          color: Colors.black54,
          width: 3.0,
        ),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.black12,
        backgroundImage: PhotoUrl != null ? NetworkImage(PhotoUrl!) : null,
        child: PhotoUrl == null
            ? Icon(
                Icons.camera_alt,
                size: radius,
              )
            : null,
      ),
    );
  }
}
