part of 'post_cubit.dart';

sealed class PostState extends Equatable {
  PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {
  final EnumStatus enumStatus;
  final List<PostEntity> list;

  PostLoading(this.enumStatus, {this.list = const []});
}

final class PostLoaded extends PostState {
  final List<PostEntity> list;
  final String message;
  final int page;

  PostLoaded(this.list, this.message, {this.page = 0});
}

final class PostError extends PostState {
  final String message;

  PostError(this.message);
}
