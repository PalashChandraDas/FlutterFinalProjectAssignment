import 'package:final_project/utils/di.dart';
import 'package:final_project/views/home_screen.dart';
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
      title: 'Final Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      initialBinding: MyDI(),

      getPages: [
        GetPage(name: '/', page: () => HomeScreen(),),
      ],
    );
  }
}
