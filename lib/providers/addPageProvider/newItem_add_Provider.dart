import 'package:books/models/models/items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddItemNotifier extends StateNotifier<List<Items>> {
  AddItemNotifier() : super([]);
  final priceController = TextEditingController();
}

final listAddProvider = StateNotifierProvider<AddItemNotifier, List<Items>>(
    (ref) => AddItemNotifier());
