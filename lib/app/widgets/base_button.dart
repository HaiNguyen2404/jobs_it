import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final Alignment? alignment;

  const BaseButton({
    super.key,
    this.text,
    this.onPressed,
    this.buttonStyle,
    this.textStyle,
    this.height,
    this.width,
    this.margin,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
