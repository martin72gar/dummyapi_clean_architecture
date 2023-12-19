import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture/common/enum_status.dart';
import 'package:clean_architecture/domain/entities/comment_entity.dart';
import 'package:clean_architecture/domain/usecase/get_comment_list.dart';
import 'package:equatable/equatable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit(this.getCommentListUsecase) : super(CommentInitial());

  final GetCommentListUsecase getCommentListUsecase;
  static final controller = RefreshController();

  getCommentList() async {
    emit(const CommentLoading(EnumStatus.loading));
    final result = await getCommentListUsecase.fetchCommentList("0");
    result.fold((l) {
      emit(CommentError(l.toString()));
      controller.refreshCompleted();
    }, (r) {
      emit(CommentLoaded(r, "Comment data loaded", EnumStatus.loaded));
      controller.refreshCompleted();
    });
  }

  getRefresh() {
    emit(CommentLoaded([], "Comment data loaded", EnumStatus.loaded));
    emit(CommentLoading(EnumStatus.loaded));
    getCommentList();
  }

  getCommentListMore() async {
    var myState = state as CommentLoaded;
    final newList = myState.list;
    int pageNext = myState.page + 1;

    final result = await getCommentListUsecase.fetchCommentList(pageNext.toString());
    result.fold((l) {
      emit(CommentError(l.toString()));
      controller.loadComplete();
    }, (r) {
      newList.addAll(r);
      emit(CommentLoading(EnumStatus.loaded));
      emit(CommentLoaded(newList, "Comment data loaded more", EnumStatus.loaded));
      controller.loadComplete();
    });
  }
}
