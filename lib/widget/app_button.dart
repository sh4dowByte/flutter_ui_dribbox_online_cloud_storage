// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_ui_dribbox_online_cloud_storage/config/pallete.dart';
import 'package:flutter_ui_dribbox_online_cloud_storage/utils/color.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  final String text;
  Color? textColor;
  final Widget? icon;
  final Widget? leadingIcon;
  final Color? color;
  final double? transparancy;
  final Function()? onTap;
  AppButton(
    this.text, {
    super.key,
    this.icon,
    this.color = Pallete.primary,
    this.transparancy = 1,
    this.leadingIcon,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = getBrightness(color!);

    textColor ??= brightness == Brightness.dark ? Colors.white : Colors.black;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color?.withOpacity(transparancy!),
            border: Border.all(color: color!)),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 10),
            ],
            Text(
              text,
              style: TextStyle(color: textColor),
            ),
            if (leadingIcon != null) ...[
              const SizedBox(width: 10),
              leadingIcon!,
            ],
          ],
        ),
      ),
    );
  }
}
