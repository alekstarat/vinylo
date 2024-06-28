class PaymentModel{
  final List<dynamic> cards;

  const PaymentModel({required this.cards});

  static const empty = PaymentModel(cards: []);

  PaymentModel.fromJson(Map<String, Object?> json) : this(cards: json['cards']! as List<dynamic>);

  Map<String, Object?> toJson() {
    return {
      "cards": cards
    };
  }

  PaymentModel copyWith({
    List<dynamic>? cards
  }) {
    return PaymentModel(cards: cards ?? this.cards);
  }
}