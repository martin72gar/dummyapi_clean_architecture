import 'package:bloc/bloc.dart';
import 'package:clean_architecture/domain/entities/create_user_entity.dart';
import 'package:clean_architecture/domain/entities/user_detail_entity.dart';
import 'package:clean_architecture/domain/entities/user_entity.dart';
import 'package:clean_architecture/domain/usecase/user_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetUserListUseCase getUserListUseCase;
  final GetUserDetailUseCase getUserDetailUseCase;
  final CreateUseUseCase createUseUseCase;
  static final first = TextEditingController();
  static final last = TextEditingController();
  static final email = TextEditingController();

  UserCubit(
      this.getUserListUseCase, this.getUserDetailUseCase, this.createUseUseCase)
      : super(UserInitial());

  getUserList() async {
    final result = await getUserListUseCase.call();
    result.fold((l) {
      emit(UserListError(l.toString()));
    }, (r) {
      emit(UserListLoaded(r, "Sukses"));
    });
  }

  getUserDetail() async {
    final result = await getUserDetailUseCase.call();
    result.fold((l) {
      emit(UserDetailError(l.toString()));
    }, (r) {
      emit(UserDetailLoaded(r, "Sukses"));
    });

    createUser() async {
      final result = await createUseUseCase.call();
      result.fold((l) {
        emit(UserCreateFailed(l.toString()));
      }, (r) {
        emit(UserCreateSuccess(r, "Sukses"));
      });
    }
  }
}
