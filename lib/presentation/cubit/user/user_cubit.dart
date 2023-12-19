import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture/data/model/request/create_user_request_model.dart';
import 'package:clean_architecture/domain/entities/create_user_entity.dart';
import 'package:clean_architecture/domain/entities/user_detail_entity.dart';
import 'package:clean_architecture/domain/entities/user_entity.dart';
import 'package:clean_architecture/domain/usecase/user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common/enum_status.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUserListUseCase getUserListUseCase;
  final GetUserDetailUseCase getUserDetailUseCase;
  final CreateUseUseCase createUserUseCase;
  static final first = TextEditingController();
  static final last = TextEditingController();
  static final email = TextEditingController();
  static final controller = RefreshController();

  UserCubit(this.getUserListUseCase, this.getUserDetailUseCase,
      this.createUserUseCase)
      : super(UserInitial());

  getUserList() async {
    emit(const UserListLoading(EnumStatus.loading));
    final result = await getUserListUseCase.callUserList("0");
    result.fold((l) {
      emit(UserListError(l.toString(), EnumStatus.error));
      controller.refreshCompleted();
    }, (r) {
      emit(UserListLoaded(r, "Sukses", EnumStatus.loaded));
      controller.refreshCompleted();
    });
  }

  getUserListRefresh() {
    emit(UserListLoaded([], "refresh", EnumStatus.loaded));
    getUserList();
  }

  getUserListMore() async {
    var myState = state as UserListLoaded;
    final newList = myState.list;
    int pageNext = myState.page + 1;

    log("pageNext: $pageNext");
    final result = await getUserListUseCase.callUserList(pageNext.toString());
    result.fold((l) {
      emit(UserListError(l.toString(), EnumStatus.loaded));
      controller.loadComplete();
    }, (r) {
      newList.addAll(r);
      emit(UserListLoading(EnumStatus.loaded));
      emit(UserListLoaded(newList, "User list loaded", EnumStatus.loaded,page: pageNext));
      controller.loadComplete();
    });
  }

  getUserDetail(String id) async {
    emit(const UserDetailLoading(EnumStatus.loading));
    final result = await getUserDetailUseCase.callUserDetail(id);
    result.fold((l) {
      emit(UserDetailError(l.toString(), EnumStatus.error));
    }, (r) {
      emit(UserDetailLoaded(r, "Sukses", EnumStatus.loaded));
    });
  }

  createUser(BuildContext context) async {
    emit(const UserCreateLoading("Creating user...", EnumStatus.loading));
    final curm = CreateUserRequestModel(
        firstName: first.text, lastName: last.text, email: email.text);

    final result = await createUserUseCase.callCreateUser(curm);
    result.fold((l) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l.toString())));
      emit(UserCreateFailed(l.toString(), EnumStatus.failed));
    }, (r) {
      emit(UserCreateSuccess(r, "Sukses membuat user", EnumStatus.success));
    });
  }
}
