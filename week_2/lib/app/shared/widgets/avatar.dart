import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.image});
  final ImageProvider image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ClipOval(
          child: Image(image: image),
        ),
      ),
    );
  }
}
