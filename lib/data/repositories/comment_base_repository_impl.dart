import 'package:clean_architecture/data/datasource/remote_data.dart';
import 'package:clean_architecture/data/repositories/remote_data_impl.dart';
import 'package:clean_architecture/domain/entities/comment_entity.dart';
import 'package:clean_architecture/domain/repositories/comment_base_repository.dart';
import 'package:dartz/dartz.dart';

class CommentBaseRepositoryImpl implements CommentBaseRepository {
  final RemoteDataImpl remoteDataImpl;

  CommentBaseRepositoryImpl(this.remoteDataImpl);

  @override
  Future<Either<String, List<CommentEntity>>> getListComment(String page) async {
    try {
      final result = await remoteDataImpl.listCommentModel(page);
      return Right(result.map((e) => e.toEntity()).toList());
    } catch(e) {
      return Left(e.toString());
    }
  }
}