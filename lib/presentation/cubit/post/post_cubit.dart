import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture/domain/entities/post_entity.dart';
import 'package:clean_architecture/domain/usecase/get_post_list.dart';
import 'package:equatable/equatable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common/enum_status.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit(this.getPostListUsecase) : super(PostInitial());

  final GetPostListUsecase getPostListUsecase;
  static final controller = RefreshController();

  getPostList() async {
    log("current page: 0");
    final result = await getPostListUsecase.fetchPostList("0");
    result.fold((l) {
      emit(PostError(l.toString()));
      controller.refreshCompleted();
    }, (r) {
      log("length first load: ${r.length}");
      emit(PostLoaded(r, "First Load Post"));
      controller.refreshCompleted();
    });
  }

  getRefresh() {
    emit(PostLoaded([], "Post Data refreshed"));
    emit(PostLoading(EnumStatus.loaded));
    getPostList();
  }

  getLoadMore(List<PostEntity> oldList, int page) async {
    var myState = state as PostLoaded;
    final newList = oldList;
    int pageNext = myState.page + 1;

    log("getLoadMore next page: $pageNext");
    final result = await getPostListUsecase.fetchPostList(pageNext.toString());
    result.fold((l) {
      emit(PostError(l.toString()));
      controller.loadComplete();
    }, (r) {
      newList.addAll(r);
      emit(PostLoading(EnumStatus.loaded));
      log("data: ${r.first.owner} of ${newList.length}");
      emit(PostLoaded(newList, "Load More Post", page: pageNext));
      controller.loadComplete();
    });
  }
}
