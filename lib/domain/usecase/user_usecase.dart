import 'package:clean_architecture/data/model/request/create_user_request_model.dart';
import 'package:clean_architecture/domain/entities/user_entity.dart';
import 'package:clean_architecture/domain/repositories/user_base_repository.dart';
import 'package:dartz/dartz.dart';

import '../entities/create_user_entity.dart';
import '../entities/user_detail_entity.dart';

abstract class UserUseCaseBase {
  final UserBaseRepository userBaseRepository;

  UserUseCaseBase(this.userBaseRepository);
}

class GetUserListUseCase extends UserUseCaseBase {
  GetUserListUseCase(super.userBaseRepository);

  Future<Either<String, List<UserEntity>>> callUserList(String page) async {
    return await userBaseRepository.getUserList(page);
  }
}

class GetUserDetailUseCase extends UserUseCaseBase {
  GetUserDetailUseCase(super.userBaseRepository);

  Future<Either<String, UserDetailEntity>> callUserDetail(String id) async {
    return await userBaseRepository.getUserDetail(id);
  }
}

class CreateUseUseCase extends UserUseCaseBase {
  CreateUseUseCase(super.userBaseRepository);

  Future<Either<String, CreateUserEntity>> callCreateUser(CreateUserRequestModel curm) async {
    return await userBaseRepository.createUser(curm);
  }
}
