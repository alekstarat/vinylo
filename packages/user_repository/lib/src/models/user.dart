import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/entities.dart';

// ignore: must_be_immutable
class MyUser extends Equatable {

  final String userId, email, name;
  List<dynamic> cards, orders;

  MyUser({required this.userId, required this.email, required this.name, required this.cards, required this.orders});

  static var empty = MyUser(
    userId: "",
    email: "", 
    name: "",
    cards: [],
    orders: []
  );

  MyUser copyWith({
    String? userId,
    String? email,
    String? name,
    List<dynamic>? cards,
    List<dynamic>? orders
  }) {
    return MyUser(
      userId: userId ?? this.userId, 
      email: email ?? this.email, 
      name: name ?? this.name,
      cards: cards ?? this.cards,
      orders: orders ?? this.orders
    );
  }

  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId, 
      email: email, 
      name: name,
      cards: cards,
      orders: orders
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      userId: entity.userId, 
      email: entity.email, 
      name: entity.name,
      cards: entity.cards,
      orders: entity.orders
    );
  }

  @override
  List<Object?> get props => [userId, email, name, cards, orders];

}