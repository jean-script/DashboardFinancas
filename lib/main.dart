import 'package:dashboard/app/binder/initial_bindinds.dart';
import 'package:dashboard/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: MyRoutes.pages,
      initialBinding: InitialBindings(),
    );
  }
}
