import 'package:clean_architecture/data/model/create_user_model.dart';
import 'package:clean_architecture/domain/entities/create_user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_architecture/domain/entities/user_entity.dart';

import '../entities/user_detail_entity.dart';

abstract class UserBaseRepository {
  Future<Either<String, List<UserEntity>>> getUserList();
  Future<Either<String, UserDetailEntity>> getUserDetail();
  Future<Either<String, CreateUserEntity>> createUser();
}