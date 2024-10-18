import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    super.key,
    required this.image,
    required this.height,
    required this.width,
    this.onPressed,
  });

  final AssetImage image;
  final double height;
  final double width;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: buildIconButtonWidget,
    );
  }

  Widget get buildIconButtonWidget {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // padding: const EdgeInsets.all(10),
        height: height,
        width: width,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Image(
            image: image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
