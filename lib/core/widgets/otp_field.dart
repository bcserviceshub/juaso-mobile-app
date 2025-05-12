import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juaso_mobile_app/core/utils/app_colors.dart';
import 'package:juaso_mobile_app/core/widgets/text_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpField extends StatefulWidget {
  final TextEditingController? controller;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onCompleted;
  final bool hasError;
  final int length;
  final double fieldSize;
  final String? title;

  const OtpField({
    super.key,
    this.controller,
    required this.onChanged,
    this.onCompleted,
    this.hasError = false,
    this.length = 4,
    this.fieldSize = 60,
    this.title,
  });

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  late TextEditingController _controller;
  final _pinKey = GlobalKey<FormFieldState<String>>();
  
  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }
  
  @override
  void dispose() {
    // Only dispose if we created it
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          BodyText(
            text: widget.title!,
            fontSize: 11.sp,
            textColor: AppColors.natural900,
          ),
          SizedBox(height: 8.h),
        ],
        PinCodeTextField(
          key: _pinKey,
          appContext: context,
          length: widget.length,
          obscureText: false,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(12),
            fieldHeight: widget.fieldSize.w,
            fieldWidth: widget.fieldSize.w,
            activeFillColor: Colors.white,
            inactiveFillColor: Colors.white,
            selectedFillColor: Colors.white,
            activeColor: AppColors.primary,
            inactiveColor: widget.hasError ? AppColors.error900 : AppColors.nutural500,
            selectedColor: AppColors.primary,
            errorBorderColor: AppColors.error900,
          ),
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          controller: _controller,
          keyboardType: TextInputType.number,
          onCompleted: widget.onCompleted,
          onChanged: (value) {
            // Sync with external controller if provided
            if (widget.controller != null && widget.controller!.text != value) {
              widget.controller!.text = value;
            }
            widget.onChanged(value);
          },
          beforeTextPaste: (text) {
            // Only allow digits
            return text?.contains(RegExp(r'^[0-9]+$')) ?? false;
          },
        ),
      ],
    );
  }
} 
