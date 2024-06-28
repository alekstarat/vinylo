
import 'package:shop_item_repository/shop_item_repository.dart';

class OrderQueryModel {

  final List<OrderModel> list;
  const OrderQueryModel({required this.list});

  static const empty = OrderQueryModel(list: []);

  OrderQueryModel copyWith({
    List<OrderModel>? list
  }) {
    return OrderQueryModel(list: list ?? this.list);
  }

  OrderQueryModel.fromJson(Map<String, Object?> json) :this(
    list: json['list'] as List<OrderModel>
  );

  Map<String, Object?> toJson() {
    return {
      'list' : list as String
    };
  }

  }