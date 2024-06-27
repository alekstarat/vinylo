import 'package:shop_item_repository/shop_item_repository.dart';

class OrderModel {
  final String id;
  final List<ShopItemModel> items;
  
  const OrderModel({required this.id, required this.items});

  static const empty = OrderModel(
    id : '',
    items: []
  );

  OrderModel.fromJson(Map<String, Object?> json) : this(
    id : json['id'] as String,
    items: json['items'] as List<ShopItemModel>
  );

  Map<String, Object?> toJson() {
    return {
      'id' : id,
      'items' : List<Map<String, Object?>>.generate(items.length, (int i) => items[i].toJson())
    };
  }

  OrderModel copyWith({
    String? id,
    List<ShopItemModel>? items
  }) {
    return OrderModel(
      id : id ?? this.id,
      items: items ?? this.items
    );
  }
}