import 'package:clean_architecture/domain/entities/comment_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CommentBaseRepository {
  Future<Either<String, List<CommentEntity>>> getListComment();
}