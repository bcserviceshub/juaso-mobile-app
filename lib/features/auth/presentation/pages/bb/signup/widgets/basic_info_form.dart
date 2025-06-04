import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juaso_mobile_app/core/utils/string_validators.dart';
import 'package:juaso_mobile_app/core/widgets/text_fields.dart';
import 'package:juaso_mobile_app/core/widgets/text_widgets.dart';

// Add contact preference enum at the top level
enum ContactPreference { email, phone, whatsapp, sms }

class BasicInfoForm extends StatefulWidget {

  const BasicInfoForm({Key? key}) : super(key: key);

  @override
  State<BasicInfoForm> createState() => _BasicInfoFormState();
}

class _BasicInfoFormState extends State<BasicInfoForm> {
  TextEditingController businessNameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController businessPhoneNumberController = TextEditingController();
  TextEditingController sellerController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  ContactPreference? _selectedContactPreference = ContactPreference.email;

  bool? validBusinessName;
  bool? validFullName;
  bool? validEmail;
  bool? validPhone;
  bool? validSeller;
  bool? validLocation;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          AppTextField(
            title: 'Business Name',
            hintText: 'Esi Mills',
            controller: businessNameController,
            hasError: validBusinessName == false,
            onChanged: (value) {
              if (value.isEmpty) {
                setState(() {
                  validBusinessName = value.isNotEmpty;
                });
              }
            },
          ),
          const SizedBox(height: 20),
          AppTextField(
            title: 'Full name(Owner/Manager)',
            hintText: 'Esi Mills',
            controller: fullNameController,
            hasError: validFullName == false,
            onChanged: (value) {
              if (value.isEmpty) {
                setState(() {
                  validFullName = value.isNotEmpty;
                });
              }
            },         
          ),
      
          const SizedBox(height: 20),
      
          AppTextField(
            hintText: "asdf123@gmail.com",
             title: "Business email",
             hasError: validEmail == false,
              onChanged: (value){
                if(value.isEmpty){
                  setState(() {
                    validEmail = value.isNotEmpty;
                  });
                }
              }
              ),
      
              const SizedBox(
                height: 20,
              ),
      
             AppTextField(
                    controller: businessPhoneNumberController,
                    hintText: "Eg 024000000",
                    title: "Phone Number",
                    inputType: TextInputType.phone,
                    inputFormatter: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    hasError: validPhone == false,
                    errorText:
                        StringValidators.validatePhone(businessPhoneNumberController.text),
                    onChanged: (value) {
                      setState(() {
                        validPhone = StringValidators.validateBoolPhone(value);
                      });
                    },
                  ),
      
                  const SizedBox(
                    height: 20,
                  ),
      
             AppTextField(
              title: "What do you sell in one sentence?",
              hintText: "Organic black soap & shea butter skincare",
              hasError: validSeller == false,
              onChanged: (value) {
                if(value.isEmpty){
                  setState(() {
                    validSeller = value.isNotEmpty;
                  });
                }
              },
             ),
      
             const SizedBox(height: 20,),
      
             AppTextField(
              hintText: "Community 25, Greater Accra, Ghana",
               title: "Business Location(City, Region, Country)",
               hasError: validLocation == false,
                onChanged: (value){
                  if(value.isEmpty){
                    setState(() {
                      validLocation = value.isNotEmpty;
                    });
                  }
                }
                ),
      
                const SizedBox(height: 20,),
                BodyText(text: "How would you like Juaso to contact you?",
                   fontSize: 14.0,
                ),
                
                // Add radio buttons for contact preferences
                Column(
            children: [
              // Use EdgeInsets.all(0) or EdgeInsets.zero for contentPadding
              // And set visualDensity to control compact spacing
              ListTile(
                title: Text(
                  'Whatsapp',
                  style: TextStyle(fontSize: 14.0),
                ),
                contentPadding: EdgeInsets.zero, // Keep this zero
                visualDensity: const VisualDensity(horizontal: -4, vertical: -4), // Significantly reduces vertical space
                leading: Radio<ContactPreference>(
                  value: ContactPreference.whatsapp,
                  groupValue: _selectedContactPreference,
                  onChanged: (ContactPreference? value) {
                    setState(() {
                      _selectedContactPreference = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Phone calls',
                  style: TextStyle(fontSize: 14.0),
                ),
                contentPadding: EdgeInsets.zero, // Keep this zero
                visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                leading: Radio<ContactPreference>(
                  value: ContactPreference.phone,
                  groupValue: _selectedContactPreference,
                  onChanged: (ContactPreference? value) {
                    setState(() {
                      _selectedContactPreference = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'SMS',
                  style: TextStyle(fontSize: 14.0),
                ),
                contentPadding: EdgeInsets.zero, // Keep this zero
                visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                leading: Radio<ContactPreference>(
                  value: ContactPreference.sms,
                  groupValue: _selectedContactPreference,
                  onChanged: (ContactPreference? value) {
                    setState(() {
                      _selectedContactPreference = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text(
                  'Email',
                  style: TextStyle(fontSize: 14.0),
                ),
                contentPadding: EdgeInsets.zero, // Keep this zero
                visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                leading: Radio<ContactPreference>(
                  value: ContactPreference.email,
                  groupValue: _selectedContactPreference,
                  onChanged: (ContactPreference? value) {
                    setState(() {
                      _selectedContactPreference = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 