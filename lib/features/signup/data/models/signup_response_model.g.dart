// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SignupResponseModelAdapter extends TypeAdapter<SignupResponseModel> {
  @override
  final int typeId = 6;

  @override
  SignupResponseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SignupResponseModel(
      phone: fields[34] as String,
      image: fields[33] as String,
      name: fields[30] as String,
      email: fields[31] as String,
      token: fields[32] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SignupResponseModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(30)
      ..write(obj.name)
      ..writeByte(31)
      ..write(obj.email)
      ..writeByte(32)
      ..write(obj.token)
      ..writeByte(33)
      ..write(obj.image)
      ..writeByte(34)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignupResponseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponseModel _$SignupResponseModelFromJson(Map<String, dynamic> json) =>
    SignupResponseModel(
      phone: json['phone'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$SignupResponseModelToJson(
        SignupResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'token': instance.token,
      'image': instance.image,
      'phone': instance.phone,
    };
