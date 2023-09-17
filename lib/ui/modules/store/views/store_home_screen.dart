import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/store_controller.dart';
import '../model/store_model.dart';

class StoreHomeScreen extends StatelessWidget {
  final StoreController storeController = Get.find();
  final ScrollController scrollController = ScrollController();

  StoreHomeScreen({super.key}) {
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        storeController.fetchStores();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('Store List'),
      ),
      body: Obx(() {
        if (storeController.stores.isEmpty && storeController.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            controller: scrollController,
            itemCount: storeController.stores.length + (storeController.hasMoreData ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < storeController.stores.length) {
                final Store store = storeController.stores[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 28.0),
                    child: ListTile(
                      title: Text(store.name),
                      subtitle: Text(store.address),
                      onTap: () {
                        Get.toNamed('/store-details', arguments: store);
                      },
                    ),
                  ),
                );
              } else if (storeController.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (!storeController.hasMoreData) {
                return const Center(child: Text("No more data"));
              } else {
                return const SizedBox();
              }
            },
          );
        }
      }),
    );
  }
}
