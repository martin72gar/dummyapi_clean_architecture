import 'package:clean_architecture/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PostBaseRepository {
  Future<Either<String, List<PostEntity>>> getListPost();
}