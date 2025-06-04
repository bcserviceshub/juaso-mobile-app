import 'package:flutter/material.dart';
import 'package:juaso_mobile_app/app.dart';
import 'package:juaso_mobile_app/core/utils/injections.dart';

void main() async {

await initInjections();
   
 // Small delay to ensure asset loading
  runApp(const MyApp());
}
 