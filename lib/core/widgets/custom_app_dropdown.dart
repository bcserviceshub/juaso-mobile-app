import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juaso_mobile_app/core/utils/app_colors.dart';
import 'package:juaso_mobile_app/core/widgets/app_sizes.dart';
import 'package:juaso_mobile_app/core/widgets/text_widgets.dart';

class CustomAppDropdown<T> extends StatefulWidget {
  final List<T> items;
  final List<DropdownMenuItem>? dropdownItems;
  final ValueChanged onChanged;
  final bool hasError;
  final String errorText;
  final T? value;
  final String hint;
  final bool isLoading;
  final bool hasSelected;
  final String? dropdownHint;

  const CustomAppDropdown(
      {super.key,
      required this.items,
      required this.onChanged,
      // this.isOtherSelected,
      this.hasError = false,
      this.errorText = "",
      required this.dropdownItems,
      this.isLoading = false,
      this.hasSelected = false,
      this.value,
      this.dropdownHint,
      required this.hint});

  @override
  State<CustomAppDropdown> createState() => _CustomAppDropdownState();
}

class _CustomAppDropdownState extends State<CustomAppDropdown> {
  // String? selectedSupervisorCertificate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            BodyText(text: widget.hint, fontSize: 14.sp),   
            const Spacer(),
            if (widget.isLoading)
              const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
          ],
        ),
        const SmallSized(),
        Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          color: AppColors(context: context).nutural100(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButton(
              isExpanded: true,
              items: widget.dropdownItems,
              value: widget.value,
              dropdownColor: Theme.of(context).scaffoldBackgroundColor,
              iconEnabledColor: AppColors(context: context).foreground(),
              underline: const SizedBox.shrink(),
              hint: Row(
                children: [
                  BodyText(
                        fontSize: 14.sp,
                    text: widget.dropdownHint ?? "",
                    textColor: widget.items.isNotEmpty
                        ? AppColors(context: context).nutural700()
                        : AppColors(context: context).nutural900(),
                  ),
                ],
              ),
              onChanged: (value) {
                setState(() {
                  widget.onChanged(value!);
                });
              },
            ),
          ),
        ),
        Visibility(
          //  duration: const Duration(milliseconds: 200),
          visible: widget.hasError,
          child: Column(
            children: [
              const SmallerSized(),
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
      ],
    );
  }
}
