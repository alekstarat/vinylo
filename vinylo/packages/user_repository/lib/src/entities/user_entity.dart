import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class MyUserEntity extends Equatable{

  final String userId, email, name;
  List<dynamic> cards;

  MyUserEntity({required this.userId, required this.email, required this.name, required this.cards});

  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'cards' : cards
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      userId: doc['userId'], 
      email: doc['email'], 
      name: doc['name'],
      cards: doc['cards']
    );
  }

  @override
  List<Object?> get props => [userId, email, name, cards];

}