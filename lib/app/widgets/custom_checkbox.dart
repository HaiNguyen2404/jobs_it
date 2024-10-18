import 'package:flutter/material.dart';
import 'package:jobs_it/app/theme/app_styles.dart';

class CustomCheckbox extends StatelessWidget {
  final Function(bool?)? onChanged;
  final bool? value;
  final String? text;
  final double? width;
  final EdgeInsetsGeometry? padding;
  const CustomCheckbox({
    super.key,
    required this.onChanged,
    this.text,
    this.value,
    this.width,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: buildCheckBox,
    );
  }

  Widget get buildCheckBox {
    return Container(
      padding: padding,
      width: width,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          checkboxWidget,
          SizedBox(
            width: text != null && text!.isNotEmpty ? 8 : 0,
          ),
          textWidget,
        ],
      ),
    );
  }

  Widget get checkboxWidget {
    return SizedBox(
      height: 20,
      width: 20,
      child: Checkbox(
        visualDensity: const VisualDensity(
          vertical: -4,
          horizontal: -4,
        ),
        value: value ?? false,
        onChanged: onChanged,
      ),
    );
  }

  Widget get textWidget {
    return Text(
      text ?? "",
      textAlign: TextAlign.start,
      style: AppStyles.bodySmall11,
    );
  }
}
