import 'package:flutter/foundation.dart';
import '../models/item.dart';

class ItemProvider with ChangeNotifier {
  final List<Item> _items = [
    Item(id: 1, name: 'Item 1', description: 'Descrição do Item 1'),
    Item(id: 2, name: 'Item 2', description: 'Descrição do Item 2'),
    Item(id: 3, name: 'Item 3', description: 'Descrição do Item 3'),
  ];

  List<Item> get items => [..._items];

  void addItem(String name, String description) {
    final newItem = Item(
      id: _items.length + 1,
      name: name,
      description: description,
    );
    _items.add(newItem);
    notifyListeners();
  }

  List<Item> searchItems(String query) {
    return _items
        .where((item) =>
            item.name.toLowerCase().contains(query.toLowerCase()) ||
            item.description.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}