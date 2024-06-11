import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthButton extends StatelessWidget {
  final String svgAsset;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;

  const AuthButton({
    Key? key,
    required this.svgAsset,
    required this.onPressed,
    this.width = 48.0,
    this.height = 48.0,
    this.backgroundColor,
    this.padding,
    this.borderRadius = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: SvgPicture.asset(
            svgAsset,
            width: width * 0.5, // Adjust SVG size as needed
            height: height * 0.5,
          ),
        ),
      ),
    );
  }
}
