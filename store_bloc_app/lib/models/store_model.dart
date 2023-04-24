import 'dart:convert';

// List<StoreModel> storeModelFromJson(String str) => List<StoreModel>.fromJson(json.decode(str));
List<StoreModel> storeModelFromJson(String str) => List<StoreModel>.from(json.decode(str).map((x) => StoreModel.fromJson(x)));
// List<StoreModel> storeModelFromJson(List<int> str) => List<StoreModel>.from(json.decode(utf8.decode(str)).map((x) => StoreModel.fromJson(x)));

String storeModelToJson(List<StoreModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreModel {
  StoreModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  final int id;
  final String title;
  final double price;
  final String description;
  final Category? category;
  final String image;
  final Rating? rating;

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    description: json["description"] == null ? null : json["description"],
    category: json["category"] == null ? null : categoryValues.map?[json["category"]],
    image: json["image"] == null ? null : json["image"],
    rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "price": price == null ? null : price,
    "description": description == null ? null : description,
    "category": category == null ? null : categoryValues.reverse?[category],
    "image": image == null ? null : image,
    "rating": rating == null ? null : rating?.toJson(),
  };
}

enum Category { MEN_S_CLOTHING, JEWELERY, ELECTRONICS, WOMEN_S_CLOTHING }

final categoryValues = EnumValues({
  "electronics": Category.ELECTRONICS,
  "jewelery": Category.JEWELERY,
  "men's clothing": Category.MEN_S_CLOTHING,
  "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  final double rate;
  final int count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"] == null ? null : json["rate"].toDouble(),
    count: json["count"] == null ? null : json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate == null ? null : rate,
    "count": count == null ? null : count,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}












// Product Model
class ProductModel {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Ratingg? rating;

  ProductModel({
    this.id, 
    this.title, 
    this.price, 
    this.description, 
    this.category, 
    this.image, 
    this.rating
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'] == null ? null : json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: Ratingg.fromJson(json['rating']),
    );
  }
}

// Rating Model
class Ratingg {
  final double? rate;
  final int? count;

  Ratingg({
    this.rate,
    this.count
  });

  factory Ratingg.fromJson(Map<String, dynamic> json) {
    return Ratingg(
      rate: json['rate'] == null ? null : json['rate'].toDouble(),
      count: json['count'],
    );
  }
}