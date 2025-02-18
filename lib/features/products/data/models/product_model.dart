import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class ProductModel {
  @HiveField(7)
  final List<Product> products;

  ProductModel({required this.products});
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 3)
class Product {
  @HiveField(8)
  final int? id;
  @HiveField(9)
  final String? title;
  @HiveField(10)
  final String? description;
  @HiveField(11)
  final String? category;
  @HiveField(12)
  final double? price;
  @HiveField(13)
  final double? rating;
  @HiveField(14)
  final List<String>? images;
  @HiveField(15)
  final int? stock;
  @HiveField(16)
  final String? brand;
  @HiveField(17)
  @JsonKey(name: 'thumbnail')
  final String? mainImage;
  @HiveField(18)
  final List<Review> reviews;

  Product(this.reviews,
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.price,
      required this.rating,
      required this.images,
      required this.stock,
      required this.brand,
      required this.mainImage});
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
@HiveType(typeId: 4)
class Review {
  @HiveField(19)
  final String comment;
  @HiveField(20)
  final String reviewerName;
  @HiveField(21)
  final double rating;
  @HiveField(22)
  final String reviewerEmail;
  @HiveField(23)
  final String date;

  Review(
      {required this.comment,
      required this.reviewerName,
      required this.rating,
      required this.reviewerEmail,
      required this.date});

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
