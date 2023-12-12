part of 'comment_cubit.dart';

sealed class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

final class CommentInitial extends CommentState {}

final class CommentLoading extends CommentState {
  final EnumStatus enumStatus;

  const CommentLoading(this.enumStatus);
}

final class CommentLoaded extends CommentState {
  final List<CommentEntity> list;
  final String message;
  final EnumStatus enumStatus;

  const CommentLoaded(this.list, this.message, this.enumStatus);
}

final class CommentError extends CommentState {
  final String message;

  const CommentError(this.message);
}
