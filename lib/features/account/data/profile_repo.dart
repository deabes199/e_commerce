import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:hero_store_app/core/helpers/app_constant.dart';
import 'package:hero_store_app/core/helpers/flutter_secure_stoarge.dart';
import 'package:hero_store_app/core/networking/error_model.dart';
import 'package:hero_store_app/core/networking/firebase/cloud_firebase_exception.dart';
import 'package:hero_store_app/core/networking/firebase/firebase_storage_exception.dart';
import 'package:hero_store_app/features/signup/data/models/signup_response_model.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepo {
  final firestore = FirebaseFirestore.instance;
  static final token =
      SecureStorageHelper.getSecuredString(AppConstant.userToken);

  final Box<SignupResponseModel> userBox = Hive.box('user');

  Future<Either<ErrorModel, SignupResponseModel>> displayProfileInfo() async {
    String cacheKey = 'user$token';

    if (userBox.containsKey(cacheKey)) {
      final cachedData = userBox.get(cacheKey);
      if (cachedData != null) {
        return right(cachedData);
      } else {
        return left(ErrorModel('Data not found in Hive'));
      }
    }

    try {
      final ref =
          firestore.collection(AppConstant.collectionName).doc(await token);
      final snapshot = await ref.get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        SignupResponseModel newUser = SignupResponseModel(
          phone: data['phone'],
          image: data['image'],
          name: data['name'],
          email: data['email'],
          token: data['token'],
        );

        await userBox.put(cacheKey, newUser);

        return right(newUser);
      } else {
        return left(ErrorModel('User not found in Firestore'));
      }
    } catch (error) {
      if (error is FirebaseException) {
        return left(CloudFirestoreFailure.fromFirebaseCoreException(error));
      } else {
        return left(ErrorModel(error.toString()));
      }
    }
  }

  Future<Either<ErrorModel, String>> updateName(String newName) async {
    try {
      final ref =
          firestore.collection(AppConstant.collectionName).doc(await token);
      await ref.update({
        'name': newName,
      });
      return right('Uodated success');
    } catch (e) {
      return left(ErrorModel(e.toString()));
    }
  }

  Future<Either<ErrorModel, String>> updatePhoneNumber(String phone) async {
    try {
      final ref =
          firestore.collection(AppConstant.collectionName).doc(await token);
      await ref.update({'phone': phone});
      return right('Updated success');
    } catch (e) {
      return left(ErrorModel(e.toString()));
    }
  }

  Future<Either<ErrorModel, File?>> pickImage(ImageSource source) async {
    File? image;
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        image = File(pickedFile.path);
        return right(image);
      }
      return left(ErrorModel('image not picked'));
    } catch (error) {
      return left(ErrorModel(error.toString()));
    }
  }

  Future<Either<ErrorModel, String>> updateImage(File imageFile) async {
    try {
      String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final refStoarge = FirebaseStorage.instance
          .ref()
          .child('${AppConstant.collectionName}/$fileName');
      UploadTask uploadTask = refStoarge.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      if (token == null) {
        return left(FirebaseStorageFailure('User not found'));
      }
      final userRef = firestore.collection('users').doc(token);
      await userRef.update({'image': downloadUrl});
      return right(downloadUrl);
    } catch (error) {
      if (error is FirebaseException) {
        return left(FirebaseStorageFailure.fromFirebaseCoreException(error));
      } else {
        return left(FirebaseStorageFailure(error.toString()));
      }
    }
  }
}
