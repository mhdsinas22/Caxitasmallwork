import 'package:flutter/material.dart';

class PreviewImages extends StatelessWidget {
  const PreviewImages({super.key, required this.imagepath});
  final String imagepath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        image: DecorationImage(image: AssetImage(imagepath), fit: BoxFit.cover),
      ),
    );
  }
}
