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

  getPostList(String page) async {
    emit(PostLoading(EnumStatus.loading));
    final result = await getPostListUsecase.fetchPostList(page);
    result.fold((l) {
      emit(PostError(l.toString()));
    }, (r) {
      emit(PostLoaded(r, "Data Post berasil dimuat", EnumStatus.loaded, page));
    });
  }
}
