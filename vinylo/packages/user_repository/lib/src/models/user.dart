import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/entities.dart';

// ignore: must_be_immutable
class MyUser extends Equatable {

  final String userId, email, name;
  List<dynamic> cards;

  MyUser({required this.userId, required this.email, required this.name, required this.cards});

  static var empty = MyUser(
    userId: "",
    email: "", 
    name: "",
    cards: []
  );

  MyUser copyWith({
    String? userId,
    String? email,
    String? name,
    List<dynamic>? cards
  }) {
    return MyUser(
      userId: userId ?? this.userId, 
      email: email ?? this.email, 
      name: name ?? this.name,
      cards: cards ?? this.cards
    );
  }

  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId, 
      email: email, 
      name: name,
      cards: cards
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      userId: entity.userId, 
      email: entity.email, 
      name: entity.name,
      cards: entity.cards
    );
  }

  @override
  List<Object?> get props => [userId, email, name, cards];

}