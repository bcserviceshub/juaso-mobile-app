import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juaso/core/utils/app_colors.dart';


class AppButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isLoading;
  final bool isDisabled;
  final Color? color, textColor;
  final EdgeInsets? padding;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.color,
    this.textColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
   
   return InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {
      if(isDisabled || isLoading){
        return;
      }else{
         onPressed();
      }
    },
     child: Material(
      color: color ??
      (isDisabled || isLoading ?
       AppColors(context: context).natural(100) :
        AppColors.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: isLoading
         ? Padding(
          padding: padding ?? EdgeInsets.symmetric(vertical: 12.h),
          child: Center(
            
            child: SizedBox(
              width: 24.w,
              height: 24.h,
              child: CircularProgressIndicator(
                valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.black,
                ),
                backgroundColor: Colors.grey.shade400,
              ),
            ),
          ),
          )
          : Padding(
            padding: padding ?? EdgeInsets.symmetric(vertical: 12.h),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
     
     ),
   );
     
  }
  
}

class AppButtonAlt extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isLoading;
  final bool isDisabled;
  final Color? textColor;
  final EdgeInsets? padding;
  final double? fontSize;

  const AppButtonAlt({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.textColor,
    this.padding, 
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap:(){
        onPressed();
      },
      child: Material(
        color: AppColors(context: context).natural(100),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: textColor ?? AppColors.primary,
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors(context: context).foreground(),
                fontSize: fontSize ?? 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}