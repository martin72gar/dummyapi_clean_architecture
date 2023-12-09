import 'package:bloc/bloc.dart';
import 'package:clean_architecture/domain/entities/comment_entity.dart';
import 'package:clean_architecture/domain/usecase/get_comment_list.dart';
import 'package:equatable/equatable.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  final GetCommentListUsecase getCommentListUsecase;

  CommentCubit(this.getCommentListUsecase) : super(CommentInitial());

  getCommentList() async {
    final result = await getCommentListUsecase.fetchCommentList();
    result.fold((l) {
      emit(CommentError(l.toString()));
    }, (r) {
      emit(CommentLoaded(r, "Sukses"));
    });
  }
}
