import 'package:flutter/material.dart';
import 'package:juaso_mobile_app/core/widgets/app_buttons.dart';
import 'package:juaso_mobile_app/core/widgets/app_sizes.dart';
import 'package:juaso_mobile_app/core/widgets/text_widgets.dart';

class BusinessRegistrationComplete extends StatelessWidget {
  static String routeName = '/business-registration-complete';
  const BusinessRegistrationComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 166),
            Center(
              child: Image.asset(
                'assets/images/auth/signup/Done.png',
                width:232 ,
                height: 210,
              ),
            ),
            MediumSized(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Header2Text(
                    text: "Business Registration has been\n successfully completed",
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  ),
                  MediumSized(),
                  BodyText(
                    text:
                        "A confirmation message will be sent to you within 5 to 7 working days",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            ExtraLargeSized(),

            SizedBox(
              width: 263,
              height: 42,
              child: AppButton(
                text: "continue",
                onPressed: (){},
                ),
            ),





            
            
          ],
        ),
      ),
    );
  }
}