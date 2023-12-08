import 'package:dartz/dartz.dart';
import 'package:clean_architecture/domain/entities/user_entity.dart';

abstract class UserBaseRepository {
  Future<Either<String, List<UserEntity>>> getUserList();
  Future<Either<String, UserEntity>> getUserDetail();
  Future<Either<String, UserEntity>> createUser();
}