import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:test_zens_company/algorithm/algorithm_screen.dart';
import 'package:test_zens_company/joke/joke_screen.dart';
import 'package:test_zens_company/utils/app_layout.dart';
import 'package:test_zens_company/widgets/app_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ZenS Company Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                boxColor: Colors.green,
                textButton: 'Algorithm Screen',
                onTap: () {
                  Get.to(() => AlgorithmScreen());
                },
              ),
              Gap(AppLayout.getHeight(50)),
              AppButton(
                boxColor: Colors.blue,
                textButton: 'Joke Screen',
                onTap: () {
                  Get.to(() => JokeScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
