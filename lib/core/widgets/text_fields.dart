import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:juaso_mobile_app/core/utils/app_colors.dart';
import 'package:juaso_mobile_app/core/widgets/app_sizes.dart';
import 'package:juaso_mobile_app/core/widgets/text_widgets.dart';

class AppTextField extends StatefulWidget {
  final String hintText, title, errorText, successMessage;
  final bool isPassword, hasError, showSuccessMessage;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final ValueChanged<String> onChanged;
  final Widget? suffixChild;
  final List<TextInputFormatter>? inputFormatter;
  final bool isloding;

  const AppTextField({
    super.key,
    required this.hintText,
    required this.title,
    required this.onChanged,
    this.isPassword = false,
    this.hasError = false,
    this.showSuccessMessage = false,
    this.isloding = false,
    this.errorText = "",
    this.successMessage = "",
    this.controller,
    this.inputType,
    this.suffixChild,
    this.inputFormatter,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      isObscure = widget.isPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: BodyText(text: widget.title)),
            // const Spacer(),
             Visibility(
              visible: widget.isloding,
              child: const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                // padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: AppColors(context: context).nutural100(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  keyboardType: widget.inputType,
                  controller: widget.controller,
                  obscureText: isObscure,
                  inputFormatters: widget.inputFormatter,
                  onChanged: (value) {
                    widget.onChanged(value);
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      color: AppColors.nutural500,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: Visibility(
                      visible: widget.isPassword,
                      child: IconButton(
                        icon: Icon(
                          !isObscure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.nutural500,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            widget.suffixChild ?? const SizedBox(),
          ],
        ),
        Visibility(
          //  duration: const Duration(milliseconds: 200),
          visible: widget.hasError,
          child: Column(
            children: [
              const SmallSized(),
              Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: AppColors.error900,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.errorText,
                    style: TextStyle(
                      color: AppColors.error900,
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            ],
          ).animate().fadeIn(),
        ),
        Visibility(
          visible: widget.showSuccessMessage,
          child: Column(
            children: [
              const SmallSized(),
              Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: AppColors.success900,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: BodyText(
                      text: widget.successMessage,
                      textColor: AppColors.success900,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
