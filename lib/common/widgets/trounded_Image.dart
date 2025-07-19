import 'package:flutter/material.dart';

class TroundedImage extends StatelessWidget {
  const TroundedImage({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.width = 150,
    this.height = 158,
    this.applyImageradius = false,
    required this.imageurl,
    this.fit = BoxFit.contain,
    this.backgroundcolor = Colors.amberAccent,
    this.isnetworkimage = false,
    required this.borderradius,
  });

  final double? width, height;
  final String imageurl;
  final bool applyImageradius;
  final BoxBorder? border;
  final Color backgroundcolor;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final bool isnetworkimage;
  final VoidCallback? onPressed;
  final double borderradius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundcolor,
          borderRadius: BorderRadius.circular(borderradius),
        ),
        child: ClipRRect(
          borderRadius:
              applyImageradius
                  ? BorderRadius.circular(borderradius)
                  : BorderRadius.zero,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage(imageurl)),
            ),
          ),
        ),
      ),
    );
  }
}
