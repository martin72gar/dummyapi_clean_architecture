part of 'comment_cubit.dart';

sealed class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

final class CommentInitial extends CommentState {}

final class CommentLoaded extends CommentState {
  final List<CommentEntity> list;
  final String message;

  CommentLoaded(this.list, this.message);
}

final class CommentError extends CommentState {
  final String message;

  CommentError(this.message);
}
