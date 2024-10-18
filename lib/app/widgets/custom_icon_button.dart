import 'package:flutter/material.dart';
import 'package:jobs_it/app/widgets/base_button.dart';

class CustomIconButton extends BaseButton {
  const CustomIconButton({
    super.key,
    super.text,
    super.margin,
    super.alignment,
    super.buttonStyle,
    super.height,
    super.width,
    super.onPressed,
    super.textStyle,
    this.image,
  });

  final AssetImage? image;

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
        height: 76,
        width: 76,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Align(
          alignment: Alignment.center,
          child: image != null
              ? Image(
                  image: image!,
                  height: 50,
                  width: 50,
                )
              : const Icon(Icons.filter),
        ),
      ),
    );
  }
}
