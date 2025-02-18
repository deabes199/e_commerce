import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'signup_response_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 6)
class SignupResponseModel {
  @HiveField(30)
  final String name;
   @HiveField(31)
  final String email;
   @HiveField(32)
  final String token;
   @HiveField(33)
  final String image;
   @HiveField(34)
  final String phone;

  SignupResponseModel(
      {required this.phone,
      required this.image,
      required this.name,
      required this.email,
      required this.token});
  factory SignupResponseModel.fromJson(Map<String, dynamic> data) =>
      _$SignupResponseModelFromJson(data);
  Map<String, dynamic> toJson() => _$SignupResponseModelToJson(this);
}
