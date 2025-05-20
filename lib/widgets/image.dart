import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Image.asset('assets/genericimage.jpg', 
        fit: BoxFit.cover
        ),
      ),
    );
  }
}