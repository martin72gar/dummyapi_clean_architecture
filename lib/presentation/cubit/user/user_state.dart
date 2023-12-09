part of 'user_cubit.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserListLoaded extends UserState {
  final List<UserEntity> list;
  final String message;

  UserListLoaded(this.list, this.message);
}

final class UserListError extends UserState {
  final String message;

  UserListError(this.message);
}

final class UserDetailLoaded extends UserState {
  final UserDetailEntity user;
  final String message;

  UserDetailLoaded(this.user, this.message);
}

final class UserDetailError extends UserState {
  final String message;

  UserDetailError(this.message);
}

final class UserCreateSuccess extends UserState {
  final CreateUserEntity user;
  final String message;

  UserCreateSuccess(this.user, this.message);
}

final class UserCreateFailed extends UserState {
  final String message;

  UserCreateFailed(this.message);
}
