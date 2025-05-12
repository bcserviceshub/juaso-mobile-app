import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:juaso_mobile_app/core/utils/app_colors.dart';
import 'package:juaso_mobile_app/core/widgets/text_widgets.dart';


class AppTextField extends StatefulWidget {
  final String hintText;
  final String title;
  final String errorText;
  final String successMessage;
  final bool isPassword;
  final bool hasError;
  final bool showSuccessMessage;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final ValueChanged<String> onChanged;
  final Widget? suffixChild;
  final List<TextInputFormatter>? inputFormatters;
  final bool isLoading , autoFocus;
  
  const AppTextField({
    super.key,
    required this.hintText,
    required this.title,
    required this.onChanged,
    this.isPassword = false,
    this.autoFocus = false,
    this.hasError = false,
    this.showSuccessMessage = false,
    this.isLoading = false,
    this.errorText="",
    this.successMessage="",
    this.controller,
    this.inputType,
    this.suffixChild,
    this.inputFormatters,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isObscure = false;
  @override
  void initState() {
    // TODO: implement initState
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
            Expanded(child: BodyText(
              text: widget.title,
              fontSize: 11,
            )),
            Visibility(
              visible: widget.isLoading,
              child: const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
              
                ),
              ),
            )

          ],
        ),
        const SizedBox(height: 8),

        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors(context: context).nutural100(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextFormField(
                  keyboardType: widget.inputType,
                  controller: widget.controller,
                  obscureText: isObscure,
                  inputFormatters: widget.inputFormatters,
                  onChanged: (value){
                    widget.onChanged(value);
                  },
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                     hintText: widget.hintText,
                      hintStyle: TextStyle(
                        color: AppColors.nutural500,
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                      ),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: Visibility(
                        visible: widget.isPassword,
                        child: IconButton(
                          onPressed: (){
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          icon: Icon(
                            isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                            color: AppColors.nutural500,
                            size: 20,
                          ),
                        ),
                      ), 

                  ),
        
                ),
                
              ),
            ),
            const SizedBox(width: 8),
            widget.suffixChild ?? const SizedBox(),
          ],
        ),
        Visibility(
          visible: widget.hasError,
          child: Row(
            children: [
              Icon(
                Icons.info_outline,
                color: AppColors.error900,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                widget.errorText,
                style: TextStyle(
                  color: AppColors.error900,
                  fontSize: 14,     
                ),
              ),
            ],
          ).animate().fadeIn(),
        ),
        Visibility(
          visible: widget.showSuccessMessage,
          child: Column(
            children: [
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: AppColors(context: context).appTextFieldSuccess(),
                    size: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: BodyText(
                      text: widget.successMessage,
                      textColor: AppColors(context: context).appTextFieldSuccess(),
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
