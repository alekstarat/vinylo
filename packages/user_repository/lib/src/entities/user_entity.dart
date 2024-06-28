import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class MyUserEntity extends Equatable{

  final String userId, email, name;
  List<dynamic> cards, orders;

  MyUserEntity({required this.userId, required this.email, required this.name, required this.cards, required this.orders});

  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'cards' : cards,
      'orders': orders
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      userId: doc['userId'], 
      email: doc['email'], 
      name: doc['name'],
      cards: doc['cards'],
      orders: doc['orders']
    );
  }

  @override
  List<Object?> get props => [userId, email, name, cards, orders];

}