import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juaso_mobile_app/core/utils/string_validators.dart';
import 'package:juaso_mobile_app/core/widgets/text_fields.dart';
import 'package:juaso_mobile_app/core/widgets/text_widgets.dart';
import 'package:juaso_mobile_app/features/auth/presentation/pages/bb/signup/widgets/upload_box_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

enum VendorNationality { ghanaVendor, internationalVendor }
enum RegisteredBusiness {Yes, No}
class VendorVerificationForm extends StatefulWidget {
  const VendorVerificationForm({Key? key}) : super(key: key);

  @override
  State<VendorVerificationForm> createState() => _VendorVerificationFormState();
}

class _VendorVerificationFormState extends State<VendorVerificationForm> {
  TextEditingController businessRegistrationNumberController = TextEditingController();
  TextEditingController ghanaCardNumberController = TextEditingController();
  TextEditingController taxIdentificationNumberController = TextEditingController();

  VendorNationality? _selectedVendorNationality = VendorNationality.ghanaVendor;
  RegisteredBusiness? _selectedRegisteredBusiness = RegisteredBusiness.Yes;

  bool? _isBusinessRegistrationNumberValid;
  bool? _isGhanaCardNumberValid;

  // File variables
  File? _ghanaCardFile;
  File? _businessRegistrationFile;

  
  @override
  void dispose() {
    businessRegistrationNumberController.dispose();
    ghanaCardNumberController.dispose();
    taxIdentificationNumberController.dispose();
    super.dispose();
  }
  
  // Method to pick Ghana Card file
  Future<void> _pickGhanaCardFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
        allowMultiple: false,
      );

      if (result != null) {
        setState(() {
          _ghanaCardFile = File(result.files.single.path!);
        });
        // You can add a success message here if needed
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ghana Card file selected successfully')),
        );
      }
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error selecting file: $e')),
      );
    }
  }

  // Method to pick Business Registration file
  Future<void> _pickBusinessRegistrationFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
        allowMultiple: false,
      );

      if (result != null) {
        setState(() {
          _businessRegistrationFile = File(result.files.single.path!);
        });
        // You can add a success message here if needed
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Business Registration file selected successfully')),
        );
      }
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error selecting file: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Column(
              children: [
                const SizedBox(height: 20),
                BodyText(text: "Are you registering as a vendor from Ghana or another country?",
                fontSize: 14.sp,
                ),
                // Use EdgeInsets.all(0) or EdgeInsets.zero for contentPadding
                // And set visualDensity to control compact spacing
                ListTile(
                  title: Text(
                    'Ghana Vendor',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  contentPadding: EdgeInsets.zero, // Keep this zero
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4), // Significantly reduces vertical space
                  leading: Radio<VendorNationality>(
                    value: VendorNationality.ghanaVendor,
                    groupValue: _selectedVendorNationality,
                    onChanged: (VendorNationality? value) {
                      setState(() {
                        _selectedVendorNationality = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    'International Vendor',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  contentPadding: EdgeInsets.zero, // Keep this zero
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                  leading: Radio<VendorNationality>(
                    value: VendorNationality.internationalVendor,
                    groupValue: _selectedVendorNationality,
                    onChanged: (VendorNationality? value) {
                      setState(() {
                        _selectedVendorNationality = value;
                      });
                    },
                  ),
                ),
              ],
           ),
           const SizedBox(height: 20),
           BodyText(text: "Do you have a registered business?",
                fontSize: 14.sp,
                ),
            
             ListTile(
                  title: Text(
                    'Yes',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  contentPadding: EdgeInsets.zero, // Keep this zero
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4), // Significantly reduces vertical space
                  leading: Radio<RegisteredBusiness>(
                    value: RegisteredBusiness.Yes,
                    groupValue: _selectedRegisteredBusiness,
                    onChanged: (RegisteredBusiness? value) {
                      setState(() {
                         _selectedRegisteredBusiness = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    'No',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  contentPadding: EdgeInsets.zero, // Keep this zero
                  visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                  leading: Radio<RegisteredBusiness>(
                    value: RegisteredBusiness.No,
                    groupValue: _selectedRegisteredBusiness,
                    onChanged: (RegisteredBusiness? value) {
                      setState(() {
                         _selectedRegisteredBusiness = value;
                      });
                    },
                  ),
                ),
      
                const SizedBox(height: 20),
      
                AppTextField(
                  controller: businessRegistrationNumberController,
                  hintText: "Enter your RGD number if registered",
                  title:"Business Registration Number",
                  inputType: TextInputType.number,
                  inputFormatter: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  hasError: _isBusinessRegistrationNumberValid == false,
                  errorText: "Invalid Business Registration Number",
                  onChanged: (value) {
                    setState(() {
                      _isBusinessRegistrationNumberValid = StringValidators.validateBoolPhone(value);
                    });
                  },
                ),
                const SizedBox(height: 20),
                 AppTextField(
                  controller: ghanaCardNumberController,
                  hintText: "000-2222-56890",
                  title:"Ghana Card Number (Owner/Manager)",
                  inputType: TextInputType.number,
                  inputFormatter: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  hasError: _isGhanaCardNumberValid == false,
                  errorText: "Invalid Ghana Card Number",
                  onChanged: (value) {
                    setState(() {
                       _isGhanaCardNumberValid = StringValidators.validateBoolPhone(value);
                    });
                  },
                ),
                const SizedBox(height: 20),
      
                AppTextField(
                  controller: taxIdentificationNumberController,
                  hintText: "002346738901",
                   title: "Tax Identification Number (TIN) (optional)",
                   onChanged: (value){
                    setState(() {
                      
                    });
                   }
                   ),
                   const SizedBox(height: 20),
                   UploadBoxWidget(
                    title: _ghanaCardFile != null 
                        ? "Ghana Card: ${_ghanaCardFile!.path.split('/').last}" 
                        : "Upload Ghana Card Image",
                    subtitle: "PDF, JPG or PNG",
                    onTap: _pickGhanaCardFile,
                    icon: Image.asset("assets/images/icons/uploadicon.png"),
                   ),

                   const SizedBox(height: 20),
                   UploadBoxWidget(
                     title: _businessRegistrationFile != null 
                         ? "Business Reg: ${_businessRegistrationFile!.path.split('/').last}"
                         : "Upload Business Registration Certificate (optional)",
                     subtitle: "PDF, JPG or PNG",
                     onTap: _pickBusinessRegistrationFile,
                     icon: Image.asset("assets/images/icons/uploadicon.png"),
                   ),
                    const SizedBox(height: 50,),
        ],
      ),
    );
  }

} 