import 'package:flutter/material.dart';

class CustomButon extends StatelessWidget {
  const CustomButon({
    super.key,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    required this.title,
    this.onPressed,
    this.side,
  });
  final Color? textColor;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final String title;
  final void Function()? onPressed;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return TextButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(vertical: height * 0.016),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            side: side ?? BorderSide(color: Colors.transparent),
            borderRadius:
                borderRadius ??
                BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
          backgroundColor ?? Colors.white,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: textColor ?? Colors.black,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
