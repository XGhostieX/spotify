part of 'profile_cubit.dart';

sealed class ProfileState {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final User user;

  const ProfileSuccess(this.user);
}

final class ProfileFailure extends ProfileState {
  final String errMsg;

  const ProfileFailure(this.errMsg);
}
