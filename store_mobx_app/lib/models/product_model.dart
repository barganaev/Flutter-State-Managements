class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Ratingg? rating;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = price == null ? null : json['price'].toDouble(); // Error was here!
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = Ratingg.fromJson(json['rating']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    data['rating'] = rating;
    return data;
  }
}

// Rating Model
class Ratingg {
  double? rate;
  int? count;

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