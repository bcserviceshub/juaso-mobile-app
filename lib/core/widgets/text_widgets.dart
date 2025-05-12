import 'package:flutter/material.dart';
import 'package:juaso/core/utils/app_colors.dart';



class BodyText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final double? height;
  const BodyText(
      {super.key,
      required this.text,
      this.textColor,
      this.fontWeight,
      this.fontSize,
      this.textDecoration,
      this.height,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: textColor,
            fontWeight: fontWeight,
            height: height,
            fontSize: fontSize,
            decoration: textDecoration,
          ),
    );
  }
}

class LinkText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final Function? onTap;
  const LinkText({
    super.key,
    required this.text,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.textDecoration,
    this.textAlign,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          color: textColor ?? AppColors(context: context).foreground(),
          fontWeight: fontWeight ?? FontWeight.w400,
          // height: 1.8,
          fontSize: fontSize ?? 16,
          decoration: textDecoration ?? TextDecoration.underline,
          decorationColor: textColor ?? AppColors(context: context).foreground(),
          decorationThickness: 2,
        ),
      ),
    );
  }
}

class TabActiveText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const TabActiveText(
      {super.key,
      required this.text,
      this.textColor,
      this.fontWeight,
      this.fontSize,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: textColor ?? AppColors(context: context).nutural800(),
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize ?? 13,
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const DescriptionText(
      {super.key,
      required this.text,
      this.textColor,
      this.fontWeight,
      this.fontSize,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.labelSmall!.copyWith(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
    );
  }
}

class Header2Text extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const Header2Text(
      {super.key,
      required this.text,
      this.textColor,
      this.fontWeight,
      this.fontSize,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: fontWeight ?? FontWeight.w700,
            height: 1.8,
            fontSize: fontSize ?? 18,
          ),
    );
  }
}

class Header1Text extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const Header1Text(
      {super.key,
      required this.text,
      this.textColor,
      this.fontWeight,
      this.fontSize,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: textColor,
            fontWeight: fontWeight ?? FontWeight.w700,
            height: 1.8,
            fontSize: fontSize ?? 20,
          ),
    );
  }
}

class AppBarLargeText extends StatelessWidget {
  final String text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  const AppBarLargeText(
      {super.key,
      required this.text,
      this.textColor,
      this.fontWeight,
      this.textAlign,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: textColor,
            fontWeight: fontWeight ?? FontWeight.w700,
            fontSize: fontSize,
            height: 1.5,
          ),
    );
  }
}
