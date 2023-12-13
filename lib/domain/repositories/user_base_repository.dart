import 'package:clean_architecture/data/model/request/create_user_request_model.dart';
import 'package:clean_architecture/domain/entities/create_user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_architecture/domain/entities/user_entity.dart';

import '../entities/user_detail_entity.dart';

abstract class UserBaseRepository {
  Future<Either<String, List<UserEntity>>> getUserList(String page);
  Future<Either<String, UserDetailEntity>> getUserDetail(String id);
  Future<Either<String, CreateUserEntity>> createUser(CreateUserRequestModel curm);
}
