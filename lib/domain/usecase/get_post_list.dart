import 'package:clean_architecture/domain/entities/post_entity.dart';
import 'package:clean_architecture/domain/repositories/post_base_repository.dart';
import 'package:dartz/dartz.dart';

class GetPostList {
  final PostBaseRepository postBaseRepository;

  GetPostList(this.postBaseRepository);

  Future<Either<String, List<PostEntity>>> fetchPostList() {
    return postBaseRepository.getListPost();
  }

}