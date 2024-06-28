import 'package:shop_item_repository/shop_item_repository.dart';

class OrderModel {

  final List<ShopItemModel> items;
  
  const OrderModel({required this.items});

  static const empty = OrderModel(
    items: []
  );

  String fromString(Map<String, Object?> json) {
    return json['items'].toString();
  }

  OrderModel.fromJson(Map<String, Object?> json) : this(
    items: json['items'] as List<ShopItemModel>
  );

  Map<String, Object?> toJson() {
    return {
      'items' : List<Map<String, Object?>>.generate(items.length, (int i) => items[i].toJson())
    };
  }

  OrderModel copyWith({
    List<ShopItemModel>? items
  }) {
    return OrderModel(
      items: items ?? this.items
    );
  }
}