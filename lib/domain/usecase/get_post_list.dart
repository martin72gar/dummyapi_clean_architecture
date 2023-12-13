import 'package:clean_architecture/domain/entities/post_entity.dart';
import 'package:clean_architecture/domain/repositories/post_base_repository.dart';
import 'package:dartz/dartz.dart';

class GetPostListUsecase {
  final PostBaseRepository postBaseRepository;

  GetPostListUsecase(this.postBaseRepository);

  Future<Either<String, List<PostEntity>>> fetchPostList(String page) {
    return postBaseRepository.getListPost(page);
  }
}
