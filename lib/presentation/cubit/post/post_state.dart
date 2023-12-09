part of 'post_cubit.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

final class PostLoaded extends PostState {
  final List<PostEntity> list;
  final String message;

  PostLoaded(this.list, this.message);
}

final class PostError extends PostState {
  final String message;

  PostError(this.message);
}
