part of 'profile_info_cubit.dart';

@immutable
sealed class ProfileInfoState {}

final class ProfileInfoInitial extends ProfileInfoState {}

final class ProfileInfoLoading extends ProfileInfoState {}

final class ProfileInfoSuccess extends ProfileInfoState {
  final SignupResponseModel newUser;

  ProfileInfoSuccess({required this.newUser});
}

final class ProfileInfoFaliure extends ProfileInfoState {
  final String message;

  ProfileInfoFaliure({required this.message});
}

final class UpdatedNameSuccessfully extends ProfileInfoState {
  final String name;

  UpdatedNameSuccessfully({required this.name});
}

final class UpdatedPhoneSuccessfully extends ProfileInfoState {
  final String phone;

  UpdatedPhoneSuccessfully({required this.phone});
}

final class UpdatetFaliure extends ProfileInfoState {
  final String message;

  UpdatetFaliure({required this.message});
}

//////// image upload/////////////////////

final class ImageInitial extends ProfileInfoState {}

final class UpdateProfileImageSuccessfully extends ProfileInfoState {
  final String imageUrl;

  UpdateProfileImageSuccessfully({required this.imageUrl});
}

class UpdateProfileImageFaliure extends ProfileInfoState {
  final String message;

  UpdateProfileImageFaliure({required this.message});
}

class UploadProfileImageLoading extends ProfileInfoState {}

class PickImageSuccess extends ProfileInfoState {
  final File? image;

  PickImageSuccess({required this.image});
}
