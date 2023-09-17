import 'package:bondstein_online_attendance_app/ui/modules/store/controller/store_controller.dart';
import 'package:bondstein_online_attendance_app/ui/modules/store/views/store_home_screen.dart';
import 'package:bondstein_online_attendance_app/ui/modules/store_details/views/store_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final StoreController storeController = Get.put(StoreController());

   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store App',
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => StoreHomeScreen(),
        ),
        GetPage(
          name: '/store-details',
          page: () => const StoreDetailsScreen(),
        ),
      ],
    );
  }
}
