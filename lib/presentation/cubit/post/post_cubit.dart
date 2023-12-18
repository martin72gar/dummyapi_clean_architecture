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
      emit(PostLoaded(r, "First Load Post", EnumStatus.loaded));
      controller.refreshCompleted();
    });
  }

  getRefresh() {
    getPostList();
  }

  int pageNext = 1;
  getLoadMore(List<PostEntity> oldList, int page) async {
    List<PostEntity> list = oldList;

    pageNext++;

    log("getLoadMore next page: $pageNext");
    final result = await getPostListUsecase.fetchPostList(pageNext.toString());
    result.fold((l) {
      emit(PostError(l.toString()));
      controller.loadComplete();
    }, (r) {
      list.addAll(r);
      log("data: ${r.first.owner} of ${list.length}");
      emit(PostLoaded(r, "Load More Post", EnumStatus.loaded,
          page: pageNext));
      controller.loadComplete();
    });
  }
}
