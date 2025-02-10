part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {
  final SignupResponseModel newUser;

  SignupSuccess({required this.newUser});
}

final class SignupFailure extends SignupState {
  final String message;

  SignupFailure({required this.message});
}

// image

final class PickImageSuccess extends SignupState {
  final File image;

  PickImageSuccess({required this.image});
}

final class PickImageFailure extends SignupState {
  final String error;

  PickImageFailure({required this.error});
}

final class PickImageCancelled extends SignupState {}
