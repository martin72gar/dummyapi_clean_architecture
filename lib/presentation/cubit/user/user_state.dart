part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserListLoading extends UserState {
  final EnumStatus enumStatus;

  const UserListLoading(this.enumStatus);
}

final class UserListLoaded extends UserState {
  final List<UserEntity> list;
  final String message;
  final EnumStatus enumStatus;

  const UserListLoaded(this.list, this.message, this.enumStatus);
}

final class UserListError extends UserState {
  final String message;
  final EnumStatus enumStatus;

  const UserListError(this.message, this.enumStatus);
}

final class UserDetailLoading extends UserState {
  final EnumStatus enumStatus;

  const UserDetailLoading(this.enumStatus);
}

final class UserDetailLoaded extends UserState {
  final UserDetailEntity user;
  final String message;
  final EnumStatus enumStatus;

  const UserDetailLoaded(this.user, this.message, this.enumStatus);
}

final class UserDetailError extends UserState {
  final String message;
  final EnumStatus enumStatus;


  const UserDetailError(this.message, this.enumStatus);
}

final class UserCreateLoading extends UserState {
  final String message;
  final EnumStatus enumStatus;

  const UserCreateLoading(this.message, this.enumStatus);
}

final class UserCreateSuccess extends UserState {
  final CreateUserEntity user;
  final String message;
  final EnumStatus enumStatus;

  const UserCreateSuccess(this.user, this.message, this.enumStatus);
}

final class UserCreateFailed extends UserState {
  final String message;
  final EnumStatus enumStatus;

  const UserCreateFailed(this.message, this.enumStatus);
}
