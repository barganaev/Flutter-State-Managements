// class IPost {
//   int? id;
//   int? userId;
//   String? title;
//   String? body;

//   IPost.fromJson(Map<String, dynamic> json) {
//     if (json == null) return;
//     id = json['id'];
//     userId = json['userId'];
//     title = json['title'];
//     body = json['body'];
//   }

//   static List<IPost> listFromJson(List<dynamic> json) {
//     return/* json == null ? List<IPost>() : */json.map((value) => IPost.fromJson(value)).toList();
//   }
// }


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

  static List<ProductModel> listFromJsonn(List<dynamic> json) {
    return json.map((value) => ProductModel.fromJson(value)).toList();
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