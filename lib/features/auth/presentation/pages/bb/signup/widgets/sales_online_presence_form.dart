import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:juaso_mobile_app/core/widgets/custom_app_dropdown.dart';
import 'package:juaso_mobile_app/core/widgets/text_fields.dart';
import 'package:juaso_mobile_app/core/widgets/text_widgets.dart';

enum productLocation {physical, online, both}
enum acceptOrders {yes, no}
enum deliveryOption {mySelf, thirdParty,customerPickup, helpDelivery, juasoFlexRoute}

class SalesOnlinePresenceForm extends StatefulWidget {

  const SalesOnlinePresenceForm({Key? key}) : super(key: key);

  @override
  State<SalesOnlinePresenceForm> createState() => _SalesOnlinePresenceFormState();
}

class _SalesOnlinePresenceFormState extends State<SalesOnlinePresenceForm> {
  TextEditingController urlController = TextEditingController();
  productLocation? _selectedProductLocation = productLocation.physical;
  acceptOrders? _selectedAcceptOrders = acceptOrders.yes;
  deliveryOption? _selectedDeliveryOption = deliveryOption.mySelf;
  String? _selectedOnlinePlatform;

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          BodyText(
            text: "How do you currently sell your products/services?",
            fontSize: 14.sp,
          ),
          ListTile(
            title: Text(
              'Physical store only',
              style: TextStyle(fontSize: 14.sp),
            ),
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            leading: Radio<productLocation>(
              value: productLocation.physical,
              groupValue: _selectedProductLocation,
              onChanged: (productLocation? value) {
                setState(() {
                  _selectedProductLocation = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              'Online only',
              style: TextStyle(fontSize: 14.sp),
            ),
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            leading: Radio<productLocation>(
              value: productLocation.online,
              groupValue: _selectedProductLocation,
              onChanged: (productLocation? value) {
                setState(() {
                  _selectedProductLocation = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              'Both online and in-store',
              style: TextStyle(fontSize: 14.sp),
            ),
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            leading: Radio<productLocation>(
              value: productLocation.both,
              groupValue: _selectedProductLocation,
              onChanged: (productLocation? value) {
                setState(() {
                  _selectedProductLocation = value;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          CustomAppDropdown<String>(
            items: const ["Instagram", "Facebook", "WhatsApp", "TikTok", "Website", "Other"],
            value: _selectedOnlinePlatform,
            dropdownItems: const [
              DropdownMenuItem(value: "Instagram", child: Text("Instagram")),
              DropdownMenuItem(value: "Facebook", child: Text("Facebook")),
              DropdownMenuItem(value: "WhatsApp", child: Text("WhatsApp")),
              DropdownMenuItem(value: "TikTok", child: Text("TikTok")),
              DropdownMenuItem(value: "Website", child: Text("Website")),
              DropdownMenuItem(value: "Other", child: Text("Other")),
            ],
            hint: "Online selling platforms",
            dropdownHint: "Select a platform",
            onChanged: (value) {
              setState(() {
                _selectedOnlinePlatform = value as String?;
              });
            },
          ),
          const SizedBox(height: 20),
          AppTextField(
            controller: urlController,
            hintText: "mybrand on IG",
            title: "Share your online store usernames or URLs",
            onChanged: (value) {},
          ),
          const SizedBox(height: 20),
          BodyText(
            text: "Do you accept orders through these platforms?",
            fontSize: 14.sp,
          ),
          ListTile(
            title: Text(
              'Yes',
              style: TextStyle(fontSize: 14.sp),
            ),
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            leading: Radio<acceptOrders>(
              value: acceptOrders.yes,
              groupValue: _selectedAcceptOrders,
              onChanged: (acceptOrders? value) {
                setState(() {
                  _selectedAcceptOrders = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              'No',
              style: TextStyle(fontSize: 14.sp),
            ),
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            leading: Radio<acceptOrders>(
              value: acceptOrders.no,
              groupValue: _selectedAcceptOrders,
              onChanged: (acceptOrders? value) {
                setState(() {
                  _selectedAcceptOrders = value;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          BodyText(
            text: "How do you currently deliver products to customers?",
            fontSize: 14.sp,
          ),
          ListTile(
            title: Text(
              'I deliver myself',
              style: TextStyle(fontSize: 14.sp),
            ),
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            leading: Radio<deliveryOption>(
              value: deliveryOption.mySelf,
              groupValue: _selectedDeliveryOption,
              onChanged: (deliveryOption? value) {
                setState(() {
                  _selectedDeliveryOption = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              'I use a third-party rider',
              style: TextStyle(fontSize: 14.sp),
            ),
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            leading: Radio<deliveryOption>(
              value: deliveryOption.thirdParty,
              groupValue: _selectedDeliveryOption,
              onChanged: (deliveryOption? value) {
                setState(() {
                  _selectedDeliveryOption = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              'Customers pick up their orders',
              style: TextStyle(fontSize: 14.sp),
            ),
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            leading: Radio<deliveryOption>(
              value: deliveryOption.customerPickup,
              groupValue: _selectedDeliveryOption,
              onChanged: (deliveryOption? value) {
                setState(() {
                  _selectedDeliveryOption = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              'I need help with delivery',
              style: TextStyle(fontSize: 14.sp),
            ),
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            leading: Radio<deliveryOption>(
              value: deliveryOption.helpDelivery,
              groupValue: _selectedDeliveryOption,
              onChanged: (deliveryOption? value) {
                setState(() {
                  _selectedDeliveryOption = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              'I want to use Juaso FlexRoute',
              style: TextStyle(fontSize: 14.sp),
            ),
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            leading: Radio<deliveryOption>(
              value: deliveryOption.juasoFlexRoute,
              groupValue: _selectedDeliveryOption,
              onChanged: (deliveryOption? value) {
                setState(() {
                  _selectedDeliveryOption = value;
                });
              },
            ),
          ),
          const SizedBox(height: 20),
          BodyText(
            text: "Juaso FlexRoute connects you to trusted delivery riders across Ghana. We handle pickup, tracking, and customer updates",
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
} 