import '../models/item_model.dart';

class ItemsData {
  static List<ItemModel> items = [
    ItemModel(
      title: 'Mountain View',
      imageUrl: 'https://via.placeholder.com/150',
      description:
          'A beautiful mountain landscape with snow-capped peaks and green valleys.',
    ),
    ItemModel(
      title: 'Beach Sunset',
      imageUrl: 'https://via.placeholder.com/150',
      description:
          'Golden sunset over a tropical beach with palm trees and crystal clear water.',
    ),
    // Add more items as needed
  ];
}
