import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:juaso_mobile_app/core/utils/app_colors.dart';
import 'package:juaso_mobile_app/core/widgets/app_buttons.dart';
import 'package:juaso_mobile_app/core/widgets/app_sizes.dart';
import 'package:juaso_mobile_app/core/widgets/text_widgets.dart';

enum AppDialogType { success, warning, error }

class AppDialog extends StatelessWidget {
  final String subText;
  final Function? action;
  final String? actionText;
  final AppDialogType? type;

  const AppDialog({
    super.key,
    required this.subText,
    this.action,
    this.actionText,
    this.type,
  });

  Color get _color {
    switch (type) {
      case AppDialogType.success:
        return AppColors.success900;
      case AppDialogType.warning:
        return AppColors.warning900;
      case AppDialogType.error:
        return AppColors.error900;
      default:
        return AppColors.primary;
    }
  }

  Icon get _iconData {
    switch (type) {
      case AppDialogType.success:
        return Icon(Icons.check_circle, color: AppColors.success900);
      case AppDialogType.warning:
        return Icon(Icons.warning_amber, color: AppColors.warning900);
      case AppDialogType.error:
        return Icon(Icons.error, color: AppColors.error900);
      default:
        return Icon(Icons.warning_amber, color: AppColors.primary);
    }
  }

  String get _title {
    switch (type) {
      case AppDialogType.success:
        return "Success";
      case AppDialogType.warning:
        return "Warning";
      case AppDialogType.error:
        return "Error";
      default:
        return "Warning";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.cancel,
              color: AppColors(context: context).nutural900(),
              size: 30,
            ),
          ),
        ),
        CircleAvatar(
          radius: 40.0,
          backgroundColor: _color.withOpacity(0.2),
          child: Icon(
            _iconData.icon,
            size: 50,
            color: _color,
          ),
        ),
        const MediumSized(),
        Header1Text(
          text: _title,
          textColor: _color,
          fontSize: 24,
        ),
        const MediumSized(),
        BodyText(
          text: subText,
          textColor: AppColors(context: context).nutural900(),
          textAlign: TextAlign.center,
        ),
        Visibility(
          visible: action != null || actionText != null,
          child: Column(
            children: [
              const MediumSized(),
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  text: actionText ?? (action != null ? "Confirm" : "Ok"),
                  onPressed: () {
                    if (action != null) {
                      action!();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

showAppDialog(
  BuildContext context, {
  required AppDialogType type,
  required String subText,
  Function? action,
  String? actionText,
}) {
  showDialog(
    context: context,
    builder: (context) => Animate(
      effects: [
        ScaleEffect(duration: Duration(milliseconds: 250)),
      ],
      child: AlertDialog(
        backgroundColor: AppColors(context: context).background(),
        content: AppDialog(
          subText: subText,
          action: action,
          actionText: actionText,
          type: type,
        ),
      ),
    ),
  );
}
