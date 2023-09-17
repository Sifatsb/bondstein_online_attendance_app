import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../constants/api_urls/api_urls.dart';
import '../model/store_model.dart';

class StoreController extends GetxController {
  final stores = <Store>[].obs;
  final int pageSize = 10;
  int currentPage = 1;
  bool isLoading = false;
  bool hasMoreData = true;

  @override
  void onInit() {
    super.onInit();
    fetchStores();
  }

  Future fetchStores() async {
    if (isLoading || !hasMoreData) return;

    try {
      isLoading = true;
      final response = await http.get(Uri.parse('${ApiUrls().baseUrl}/api/stores?page=$currentPage'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final List<dynamic> storeData = responseData['data'];

        final List<Store> newStores = storeData.map((data) {
          return Store.fromJson(data);
        }).toList();

        if (newStores.isEmpty) {
          hasMoreData = false; // No more data to load
        } else {
          stores.addAll(newStores);
          currentPage++;
        }

        isLoading = false;
      } else {
        throw Exception('Failed to load stores');
      }
    } catch (e, t) {
      isLoading = false;
      debugPrint('Error fetching stores: $e');
      debugPrint('$t');
    }
  }
}


