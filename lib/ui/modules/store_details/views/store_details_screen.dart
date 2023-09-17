import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../store/model/store_model.dart';

class StoreDetailsScreen extends StatelessWidget {
  const StoreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Store store = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Store Details'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Name: ${store.name}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text('Address: ${store.address}'),
              // Add other store details here
            ],
          ),
        ),
      ),
    );
  }
}
