class UserConverter{

  final String email, name, userId;
  final List<dynamic> cards;

  const UserConverter({required this.email, required this.name, required this.userId, required this.cards});

  static const empty = UserConverter(
    email: "", 
    name: "", 
    userId: "", 
    cards: []
  );

  UserConverter.fromJson(Map<String, Object?> json) : this(
    email: json['email']! as String,
    name : json['name']! as String,
    userId: json['userId']! as String,
    cards: json['cards']! as List<dynamic>
  );

  Map<String, Object?> toJson() {
    return {
      'email': email,
      'name': name,
      'userId': userId,
      'cards': cards
    };
  }

  UserConverter copyWith({
    String? email,
    String? name, 
    String? userId,
    List<String>? cards
  }) {
    return UserConverter(
      email: email ?? this.email, 
      name: name ?? this.name, 
      userId: userId ?? this.userId, 
      cards: cards ?? this.cards
    );
  }
}