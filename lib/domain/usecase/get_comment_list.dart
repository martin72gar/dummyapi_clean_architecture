import 'package:clean_architecture/domain/entities/comment_entity.dart';
import 'package:clean_architecture/domain/repositories/comment_base_repository.dart';
import 'package:dartz/dartz.dart';

class GetCommentListUsecase {
  final CommentBaseRepository commentBaseRepository;

  GetCommentListUsecase(this.commentBaseRepository);

  Future<Either<String, List<CommentEntity>>> fetchCommentList() {
    return commentBaseRepository.getListComment();
  }
}
