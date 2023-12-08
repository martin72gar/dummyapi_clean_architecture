import 'package:clean_architecture/data/model/create_user_model.dart';
import 'package:clean_architecture/data/repositories/remote_data_impl.dart';
import 'package:clean_architecture/domain/entities/create_user_entity.dart';
import 'package:clean_architecture/domain/entities/user_entity.dart';
import 'package:clean_architecture/domain/repositories/user_base_repository.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/user_detail_entity.dart';

class UserBaseRepositoryImpl implements UserBaseRepository{
  final RemoteDataImpl remoteDataImpl;

  UserBaseRepositoryImpl(this.remoteDataImpl);

  @override
  Future<Either<String, CreateUserEntity>> createUser() async {
    try {
      final result = await remoteDataImpl.createUserModel();
      return Right(result.toEntity());
    } catch(e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, UserDetailEntity>> getUserDetail() async {
    try {
      final result = await remoteDataImpl.userDetailModel();
      return Right(result.toEntity());
    } catch(e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<UserEntity>>> getUserList() async {
    try {
      final result = await remoteDataImpl.listUserModel();
      return Right(result.map((e) => e.toEntity()).toList());
    } catch(e) {
      return Left(e.toString());
    }
  }
}