import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallSized extends StatelessWidget {
  const SmallSized({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 7.h,
    );
  }
}
class SmallerSized extends StatelessWidget {
  const SmallerSized({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 4.h,
    );
  }
}

class MediumSized extends StatelessWidget {
  const MediumSized({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
    );
  }
}

class LargeSized extends StatelessWidget {
  const LargeSized({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
    );
  }
}

class ExtraLargeSized extends StatelessWidget {
  const ExtraLargeSized({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.h,
    );
  }
}

// padding
double pagePaddingSize = 14.h;

EdgeInsets pagePadding = EdgeInsets.all(pagePaddingSize);

EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: pagePaddingSize, vertical: pagePaddingSize / 3);
