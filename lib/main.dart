import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kavall/common/helpers/injections.dart';
import 'package:kavall/home/ui/screens/home_page.dart';

void main() {
  setUpInjections();

  runApp(
    ScreenUtilInit(
      designSize: const Size(385, 812), // design sizes in Figma
      builder: (_, __) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kavall Delivery Statistics',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
