import 'package:clean_architecture/domain/entities/user_entity.dart';
import 'package:clean_architecture/domain/repositories/user_base_repository.dart';
import 'package:dartz/dartz.dart';

abstract class UserUseCaseBase {
  final UserBaseRepository userBaseRepository;

  UserUseCaseBase(this.userBaseRepository);
}

class GetUserListUseCase extends UserUseCaseBase {
  GetUserListUseCase(super.userBaseRepository);

  Future<Either<String, List<UserEntity>>> call() async {
    return await userBaseRepository.getUserList();
  }
}

class GetUserDetailUseCase extends UserUseCaseBase {
  GetUserDetailUseCase(super.userBaseRepository);

  Future<Either<String, UserEntity>> call() async {
    return await userBaseRepository.getUserDetail();
  }
}

class CreateUseUseCase extends UserUseCaseBase {
  CreateUseUseCase(super.userBaseRepository);

  Future<Either<String, UserEntity>> call() async {
    return await userBaseRepository.createUser();
  }
}
