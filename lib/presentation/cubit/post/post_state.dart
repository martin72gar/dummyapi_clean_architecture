part of 'post_cubit.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {
  final EnumStatus enumStatus;

  const PostLoading(this.enumStatus);
}

final class PostLoaded extends PostState {
  final List<PostEntity> list;
  final String message;
  final EnumStatus enumStatus;

  PostLoaded(this.list, this.message, this.enumStatus);
}

final class PostError extends PostState {
  final String message;

  PostError(this.message);
}
