part of 'post_cubit.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {
  final EnumStatus enumStatus;
  final List<PostEntity> list;

  const PostLoading(this.enumStatus, this.list);
}

final class PostLoaded extends PostState {
  final List<PostEntity> list;
  final String message;
  final EnumStatus enumStatus;
  final int page;

  const PostLoaded(this.list, this.message, this.enumStatus, {this.page = 0});
}

final class PostError extends PostState {
  final String message;

  const PostError(this.message);
}
