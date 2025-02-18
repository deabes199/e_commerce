// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 2;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      products: (fields[7] as List).cast<Product>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(7)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 3;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      (fields[18] as List).cast<Review>(),
      id: fields[8] as int?,
      title: fields[9] as String?,
      description: fields[10] as String?,
      category: fields[11] as String?,
      price: fields[12] as double?,
      rating: fields[13] as double?,
      images: (fields[14] as List?)?.cast<String>(),
      stock: fields[15] as int?,
      brand: fields[16] as String?,
      mainImage: fields[17] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(11)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.title)
      ..writeByte(10)
      ..write(obj.description)
      ..writeByte(11)
      ..write(obj.category)
      ..writeByte(12)
      ..write(obj.price)
      ..writeByte(13)
      ..write(obj.rating)
      ..writeByte(14)
      ..write(obj.images)
      ..writeByte(15)
      ..write(obj.stock)
      ..writeByte(16)
      ..write(obj.brand)
      ..writeByte(17)
      ..write(obj.mainImage)
      ..writeByte(18)
      ..write(obj.reviews);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ReviewAdapter extends TypeAdapter<Review> {
  @override
  final int typeId = 4;

  @override
  Review read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Review(
      comment: fields[19] as String,
      reviewerName: fields[20] as String,
      rating: fields[21] as double,
      reviewerEmail: fields[22] as String,
      date: fields[23] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Review obj) {
    writer
      ..writeByte(5)
      ..writeByte(19)
      ..write(obj.comment)
      ..writeByte(20)
      ..write(obj.reviewerName)
      ..writeByte(21)
      ..write(obj.rating)
      ..writeByte(22)
      ..write(obj.reviewerEmail)
      ..writeByte(23)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      (json['reviews'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      stock: (json['stock'] as num?)?.toInt(),
      brand: json['brand'] as String?,
      mainImage: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'rating': instance.rating,
      'images': instance.images,
      'stock': instance.stock,
      'brand': instance.brand,
      'thumbnail': instance.mainImage,
      'reviews': instance.reviews,
    };

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      comment: json['comment'] as String,
      reviewerName: json['reviewerName'] as String,
      rating: (json['rating'] as num).toDouble(),
      reviewerEmail: json['reviewerEmail'] as String,
      date: json['date'] as String,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'comment': instance.comment,
      'reviewerName': instance.reviewerName,
      'rating': instance.rating,
      'reviewerEmail': instance.reviewerEmail,
      'date': instance.date,
    };
