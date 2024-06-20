
class ShopItemModel{
  
  final String name, desc, image, artist;
  final int cost, rating;

  const ShopItemModel({required this.name, required this.desc, required this.image, required this.cost, required this.rating, required this.artist, });

  static const empty = ShopItemModel(

    name: "", 
    desc: "", 
    image: "", 
    artist: "",
    cost: 0,
    rating: 0
  );

  ShopItemModel.fromJson(Map<String, Object?> json) 
  : this(

    name: json['name']! as String,
    desc: json['desc']! as String,
    image: json['image']! as String,
    artist: json['artist']! as String,
    cost: json['cost']! as int,
    rating: json['rating']! as int
  );

  Map<String, Object?> toJson() {
    return {

      'name': name,
      'desc': desc,
      'image': image,
      'artist': artist,
      'cost': cost,
      'rating': rating 
    };
  }

  ShopItemModel copyWith({

    String? name,
    String? desc,
    String? image,
    String? artist,
    int? cost,
    int? rating
  }) {
    return ShopItemModel(

      name: name ?? this.name, 
      desc: desc ?? this.desc, 
      image: image ?? this.image, 
      artist: artist ?? this.artist,
      cost: cost ?? this.cost,
      rating: rating ?? this.rating
    );
  }
  
  
}